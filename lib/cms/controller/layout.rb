module Cms::Controller::Layout
  @no_cache    = nil

  def render_public_as_string(path, options = {})
    site = options[:site]
    return nil if path =~ /html\.r(\?|$)/ && !site.use_kana?
    return nil if path =~ /html\.mp3(\?|$)/ && !site.use_talk?

    qp = {}
    if path =~ /\?/
      qp   = Rack::Utils.parse_query(path.gsub(/.*\?/, ''))
      path = path.gsub(/\?.*/, '')
    end

    Page.initialize
    Page.site   = site
    Page.uri    = path

    begin
      node = Core.search_node(path)
      opt  = Rails.application.routes.recognize_path(node)
      opt  = qp.merge(opt)
      ctl  = opt[:controller]
      act  = opt[:action]

      opt[:authenticity_token] = params[:authenticity_token] if params[:authenticity_token]
      body = Sys::Lib::Controller.render(ctl, act, base_url: Addressable::URI.join(site.full_uri, node),
                                                   params: opt,
                                                   agent_type: options[:agent_type])

      info_log("#{URI.join(Page.site.full_uri, path)}: #{Page.error}") if Page.error
    rescue => e
      error_log e
      Page.error = 404
    end

    error = Page.error
    Page.initialize
    Page.site = site
    Page.uri  = path

    return error ? nil : body
  end

  def render_public_layout
    if Rails.env.to_s == 'production' && !@no_cache
      # enable cache
      headers.delete("Cache-Control")
      # no cache
      #response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      #response.headers["Pragma"] = "no-cache"
      #response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end

    Page.current_item = Page.current_node unless Page.current_item

    return true if @performed_redirect
    return true if params[:format] && params[:format] != 'html'
    return true if Page.error

    ## lang
    Page.lang = Page.current_item.lang if Page.current_item.respond_to?(:lang)

    ## content
    Page.content = response.body

    ## concept
    concepts = Cms::Lib::Layout.inhertited_concepts

    ## layout
    if Core.preview_mode? && params[:layout_id]
      Page.layout = Cms::Layout.find(params[:layout_id])
    elsif layout = Cms::Lib::Layout.inhertited_layout
      Page.layout    = layout.clone
      Page.layout.id = layout.id
    else
      Page.layout = Cms::Layout.new(
        body:             '[[content]]',
        mobile_body:      '[[content]]',
        smart_phone_body: '[[content]]'
      )
    end

    if params[:filename_base] =~ /^more($|_)/i &&
      Page.current_item.respond_to?(:more_layout) && Page.current_item.more_layout
      Page.layout = Page.current_item.more_layout
    end

    body = Page.layout.body_tag(request).clone.to_s

    ## render the piece
    pieces = Cms::Lib::Layout.find_design_pieces(body, concepts, params)
    if Core.preview_mode? && params[:piece_id]
      piece = Cms::Piece.find_by(id: params[:piece_id])
      pieces[piece.name] = piece if piece
    end
    pieces.each do |name, piece|
      Page.current_piece = piece
      data = Cms::PieceRenderService.new(piece).render(request, params)
      body.gsub!("[[piece/#{name}]]") { data } if data
    end

    ## render the content
    body.gsub!("[[content]]") { Page.content }

    ## render other brackets
    body = Cms::BracketRenderService.new(Page.site, concepts, mobile: request.mobile)
                                    .render_data_texts_and_files(body)

    ## mobile
    if request.mobile?
      begin
        require 'tamtam'
        body = TamTam.inline(
          css: Page.layout.tamtam_css(request),
          body: body
        )
      rescue => e #InvalidStyleException
        error_log e
      end

      case request.mobile
      when Jpmobile::Mobile::Docomo
        # for docomo
        headers["Content-Type"] = "application/xhtml+xml; charset=utf-8"
      when Jpmobile::Mobile::Au
        # for au
      when Jpmobile::Mobile::Softbank
        # for SoftBank
      when Jpmobile::Mobile::Willcom
        # for Willcom
      else
        # for PC
      end
    end

    ## ruby(kana)
    if Page.ruby
      body = Cms::Lib::Navi::Kana.convert(body, Page.site.id)
    end

    ## render the true layout
    body = render_to_string(
      html: body.to_s.force_encoding('UTF-8').html_safe,
      layout: 'layouts/public/base'
    )

    self.response_body = convert_ssl_uri(body)
  end

  def convert_ssl_uri(body)
    return body if Core.request_uri =~ /^\/_preview\//
    return body unless Page.site.use_common_ssl?

    Cms::SslLinkReplaceService.new(Page.site, Page.current_node.public_uri).run(body)
  end
end
