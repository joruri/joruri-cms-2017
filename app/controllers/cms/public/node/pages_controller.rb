class Cms::Public::Node::PagesController < Cms::Controller::Public::Base
  def pre_dispatch
    @item = Cms::Node::Page.find(Page.current_node.id)
  end

  def index
    return http_error(404) if params[:page]

    if Core.preview_mode? && params[:node_id]
      @item = Cms::Node::Page.find_by!(id: params[:node_id], parent_id: @item.parent_id, name: @item.name)
    end
    
    Page.current_node = @item
    Page.current_item = @item
    Page.title        = @item.title
    
    @body = @item.body
    
    if request.mobile?
      Page.title = @item.mobile_title if !@item.mobile_title.blank?
      @body = @item.mobile_body if !@item.mobile_body.blank?
    end
  end
end
