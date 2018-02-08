class Cms::Controller::Admin::Base < Sys::Controller::Admin::Base
  include Cms::Controller::Layout
  layout  'admin/cms'

  def default_url_options
    Core.concept ? { :concept => Core.concept.id } : {}
  end

  def initialize_application
    return false unless super

    if params[:cms_navi] && params[:cms_navi][:site]
      site_id = params[:cms_navi][:site]
      expires = site_id.blank? ? Time.now - 60 : Time.now + 60*60*24*7
      unless Core.user.root?
        # システム管理者以外は所属サイトしか操作できない
        site_id = Core.user.site_ids.first unless Core.user.site_ids.include?(site_id.to_i)
      end
      cookies[:cms_site] = {:value => site_id, :path => '/', :expires => expires}
      Core.set_concept(session, 0)
      return redirect_to "/#{ZomekiCMS::ADMIN_URL_PREFIX}"
    end

    if cookies[:cms_site] && !Core.site
      cookies.delete(:cms_site)
      Core.site = nil
    end

    if Core.user
      if params[:concept]
        concept = Cms::Concept.find_by(id: params[:concept])
        if concept && Core.site.id != concept.site_id
          Core.set_concept(session, 0)
        else
          Core.set_concept(session, params[:concept])
        end
      elsif Core.request_uri == "/#{ZomekiCMS::ADMIN_URL_PREFIX}"
        Core.set_concept(session, 0)
      else
        Core.set_concept(session)
      end
    end
    return true
  end

  private

  def http_error(status, message = nil)
    message = default_http_error_message(status, message)

    error_log("#{status} #{request.env['REQUEST_URI']}") if status != 404
    render status: status, html: "<p>#{message}</p>".html_safe, layout: "admin/cms/error"
    #return respond_to do |format|
    #  format.html { render :status => status, :text => "<p>#{message}</p>", :layout => "admin/cms/error" }
    #  format.xml  { render :status => status, :xml => "<errors><error>#{message}</error></errors>" }
    #end
  end
end
