class Survey::Public::Node::FormsController < Survey::Public::NodeController
  include SimpleCaptcha::ControllerHelpers

  before_action :set_form, only: [:show, :confirm_answers, :send_answers, :finish]

  skip_after_action :render_public_layout, if: -> { @piece }
  after_action :render_inline_layout, if: -> { @piece }

  def pre_dispatch
    @node = Page.current_node
    @content = Survey::Content::Form.find(@node.content_id)

    @piece = Survey::Piece::Form.find_by(id: params[:piece])

    @current_url = (params[:u] || params[:current_url]).to_s
    @current_url = CGI.unescape(@current_url) if @current_url.start_with?('%')
    @current_url_title = (params[:t] || params[:current_url_title]).to_s
    @current_url_title = CGI.unescape(@current_url_title) if @current_url_title.start_with?('%')
  end

  def index
    @forms = @content.forms
  end

  def show
    @form_answer = @form.form_answers.build(
      answered_url: Page.uri,
      answered_url_title: Page.title,
      remote_addr: request.remote_ip,
      user_agent: request.user_agent
    )
  end

  def confirm_answers
    build_answer

    if @form_answer.form.confirmation?
      if @content.use_captcha?
        return render :show unless @form_answer.valid_with_captcha?
        SimpleCaptcha::SimpleCaptchaData.create(key: @form_answer.captcha_key, value: @form_answer.captcha.upcase)
      else
        return render :show unless @form_answer.valid?
      end
    else
      if @content.use_captcha?
        return render :show unless @form_answer.save_with_captcha
      else
        return render :show unless @form_answer.save
      end
      return send_mail_and_redirect_to_finish
    end
  end

  def send_answers
    build_answer

    if params[:edit_answers]
      render :show
    elsif (@content.use_captcha? && !@form_answer.save_with_captcha) || !@form_answer.save
      render :show
    else
      send_mail_and_redirect_to_finish
    end
  end

  def finish
  end

  def keeping_params
    { piece: @piece&.id, u: @current_url, t: @current_url_title }.to_query
  end

  private

  def set_form
    forms = Survey::Form.all
    forms = forms.unscoped if Core.preview_mode?
    @form = forms.where(content_id: @content.id).find_by!(name: params[:id])

    Page.current_item = @form
    Page.title = @form.title
  end

  def build_answer
    @form_answer = @form.form_answers.build(
      answered_url: params[:current_url].try(:sub, %r!/confirm_answers$!, ''),
      answered_url_title: params[:current_url_title],
      remote_addr: request.remote_ip,
      user_agent: request.user_agent,
      captcha: params[:captcha],
      captcha_key: params[:captcha_key]
    )
    @form_answer.question_answers = params[:question_answers] if params[:question_answers]
  end

  def send_mail_and_redirect_to_finish
    ## send mail to admin
    if @content.mail_from.present? && (mail_to = @form.mail_to.presence || @content.mail_to).present?
      begin
        Survey::Public::Mailer.survey_receipt(form_answer: @form_answer, from: @content.mail_from, to: mail_to)
                              .deliver_now
      rescue => e
        error_log e
        Survey::Public::Mailer.survey_receipt(form_answer: @form_answer, from: @content.mail_from, to: mail_to, attachment_file: false)
                              .deliver_now rescue nil
      end
    end

    ## send mail to answer
    if @content.auto_reply? && @content.mail_from.present? && @form_answer.reply_to.present?
      begin
        Survey::Public::Mailer.survey_auto_reply(form_answer: @form_answer, from: @content.mail_from, to: @form_answer.reply_to)
                              .deliver_now
      rescue => e
        error_log e
      end
    end

    if Core.request_uri =~ /^\/_ssl\/([0-9]+).*/
      redirect_to ::File.join(Page.site.full_ssl_uri, "#{@form.public_uri}finish?#{keeping_params}")
    else
      redirect_to "#{@form.public_uri}finish?#{keeping_params}"
    end
  end

  def render_inline_layout
    Page.layout = Cms::Layout.new(
      head:             @piece.head_css.to_s,
      mobile_head:      @piece.head_css.to_s,
      smart_phone_head: @piece.head_css.to_s,
      body:             '[[content]]',
      mobile_body:      '[[content]]',
      smart_phone_body: '[[content]]'
    )
    self.response_body = render_to_string(html: response.body.html_safe, layout: 'layouts/public/base')
  end
end
