class Cms::Admin::Tool::ImportController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base
  
  def pre_dispatch
    return error_auth unless Core.user.has_auth?(:designer)
    return redirect_to(action: :index) if params[:reset]
  end
  
  def index
    @results = []
    
    @item = Cms::Model::Tool::Import.new
    return unless request.post?
    
    @item.attributes = params.require(:item).permit(:file, :concept_id)
    return unless @item.valid?
    
    ## concept
    @concept = Cms::Concept.find_by(id: @item.concept_id)
    return unless @concept
    
    require "json"
    import = JSON.parse @item.file.read
    
    @results << "インポートが完了しました。"
    
    ## layouts
    total     = import['layouts'].size
    @results << "" << "# レイアウトのインポート（全#{total}件）"
    @count    = { all: total, create: 0, update: 0, error: 0 }
    @errors   = []
    import['layouts'].each {|json| import_layout(json) }
    @results << "作成 #{@count[:create]}件, 更新 #{@count[:update]}件, エラー #{@count[:error]}件"
    
    ## pieces
    total = import['pieces'].size
    @results << "" << "# ピースのインポート（全#{total}件）"
    @count    = { all: total, create: 0, update: 0, error: 0 }
    @errors   = []
    import['pieces'].each {|json| import_pieces(json) }
    @results << "作成 #{@count[:create]}件, 更新 #{@count[:update]}件, エラー #{@count[:error]}件"
  end
  
  def import_layout(json)
    json   = json['layout']
    data   = json['layout']
    name   = data['name']
    state  = data[:state]
    
    item   = Cms::Layout.where(name: name, concept_id: @concept.id).first_or_initialize
    exists = item.id ? true : false
    
    data.delete('id')
    data.delete('site_id')
    data.delete('concept_id')
    data.delete('state')
    data.delete('recognized_at')
    data.delete('published_at')
    
    item.attributes   = data
    item.site_id    ||= Core.site.id
    item.concept_id ||= @concept.id
    item.state      ||= (state || 'closed')
    
    if !item_changed?(item)
      #
    elsif item.save
      key = exists ? :update : :create
      @count[key] += 1
      #@results << "#{name} #{action}" 
    else
      @count[:error] += 1
      @errors << "#{name} #{action} (#{item.errors.full_messages.join(' ')})" 
    end
  end
    
  def import_pieces(json)
    json   = json['piece']
    data   = json['piece']
    name   = data['name']
    state  = data[:state]
    
    piece  = Cms::Piece.where(name: name, concept_id: @concept.id).first_or_initialize
    exists = piece.id ? true : false
    
    data.delete('id')
    data.delete('site_id')
    data.delete('concept_id')
    data.delete('content_id')
    data.delete('recognized_at')
    data.delete('published_at')
    
    piece.attributes   = data
    piece.site_id    ||= Core.site.id
    piece.concept_id ||= @concept.id
    
    ## content
    concept = nil
    content = nil
    if json['content'] && json['content_concepts']
      parent  = 0
      json['content_concepts'].each do |name|
        concept = Cms::Concept.find_by(parent_id: 0, name: name)
        break unless concept
        parent  = concept.id
      end
      if concept
        name    = json['content']['name']
        content = Cms::Content.find_by(name: name, concept_id: concept.id)
      end
      piece.content_id = content.id if content
    end
    
    changed = item_changed?(piece)

    if changed && !piece.save
      @count[:error] += 1
      @errors << "#{piece.name} #{action} (#{piece.errors.full_messages.join(' ')})"
      return
    end 

    ## setting
    json['settings'].each do |data|
      next if piece.model == 'Cms::SnsPart' && data['name'] == 'mixi_data_key'

      item = Cms::PieceSetting.where(piece_id: piece.id, name: data['name']).first_or_initialize
      item.piece_id    = piece.id
      item.name        = data['name']
      item.value       = data['value']
      item.sort_no   ||= data['sort_no']
      item.extra_value = data['extra_value']
      if item_changed?(item)
        item.save
        changed = true
      end
    end if json['settings']
    
    ## links
    json['link_items'].each do |data|
      item = Cms::PieceLinkItem.where(piece_id: piece.id, name: data['name']).first_or_initialize
      item.piece_id  = piece.id
      item.state     = data['state']
      item.name      = data['name']
      item.body      = data['body']
      item.uri       = data['uri']
      item.target    = data['target']
      item.sort_no ||= data['sort_no']
      if item_changed?(item)
        item.save
        changed = true
      end
    end if json['link_items']
    
    if changed
      key = exists ? :update : :create
      @count[key] += 1
      #@results << "#{piece.name} #{action}" 
    end
  end
  
protected
  def item_changed?(item)
    return false if !item.changed?
    changed = item.changed
    changed.delete('updated_at')
    return changed.size > 0
  end
end
