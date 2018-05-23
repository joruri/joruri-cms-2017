class ApplicationController < ActionController::Base
  include ParamsKeeper::Controller
  protect_from_forgery with: :exception
  before_action :initialize_application
#  rescue_from Exception, with: :rescue_exception

  def initialize_application
    return false if Core.dispatched?
    return Core.dispatched
  end

  def browser
    @browser ||= Browser.new(request.user_agent)
  end

  def platform_encode(text)
    if browser.platform.windows?
      text.encode(Encoding::WINDOWS_31J, invalid: :replace, undef: :replace).gsub(/\r\n|\r|\n/, "\r\n")
    else
      text
    end
  end

  def send_data(data, options = {})
    options = set_default_file_options(options)
    super
  end

  def send_file(path, options = {})
    options = set_default_file_options(options)
    super
  end

  private

  def set_default_file_options(options)
    if options.include?(:filename)
      options[:filename] = URI::escape(options[:filename]) if browser.ie?
      options[:type] ||= Rack::Mime.mime_type(File.extname(options[:filename]))
      options[:disposition] ||= if browser.platform.android? || options[:type].to_s !~ %r!\Aimage/|\Aapplication/pdf\z!
                                  'attachment'
                                else
                                  'inline'
                                end
    end
    options
  end

  def rescue_action(error)
    case error
    when ActionController::InvalidAuthenticityToken
      http_error(422, "Invalid Authenticity Token")
    else
      super
    end
  end

  def http_error(status, message = nil)
    message = default_http_error_message(status, message)
    render status: status, html: "<p>#{message}</p>".html_safe, layout: 'application'
  end

  def default_http_error_message(status, message)
    message = "ページが見つかりません。" if !message && status == 404
    message = "( #{message} )" if message
    [status, Rack::Utils::HTTP_STATUS_CODES[status], message].compact.join(' ')
  end

#  def rescue_exception(exception)
#    log  = exception.to_s
#    log += "\n" + exception.backtrace.join("\n") if Rails.env.to_s == 'production'
#    error_log(log)
#
#    if Core.mode =~ /^(admin|script)$/
#      html  = %Q(<div style="padding: 0px 20px 10px; color: #e00; font-weight: bold; line-height: 1.8;">)
#      html += %Q(エラーが発生しました。<br />#{exception} &lt;#{exception.class}&gt;)
#      html += %Q(</div>)
#      if Rails.env.to_s != 'production'
#        html += %Q(<div style="padding: 15px 20px; border-top: 1px solid #ccc; color: #800; line-height: 1.4;">)
#        html += exception.backtrace.join("<br />")
#        html += %Q(</div>)
#      end
#      render inline: html, layout: "admin/cms/error", status: 500
#    else
#      http_error 500
#    end
#  end
end
