class Survey::Public::Node::FormsController < Cms::Controller::Public::Base
  include SimpleCaptcha::ControllerHelpers
  before_action :set_form, only: [:show, :confirm_answers, :send_answers, :finish]
  skip_after_action :render_public_layout
  after_action :call_render_public_layout

  def pre_dispatch
    @node = Page.current_node
    @content = Survey::Content::Form.find_by(id: @node.content.id)
    return http_error(404) unless @content

    @piece = Survey::Piece::Form.find_by(id: params[:piece])

    @current_url = (params[:u] || params[:current_url]).to_s
    @current_url = CGI.unescape(@current_url) if @current_url.start_with?('%')
    @current_url_title = (params[:t] || params[:current_url_title]).to_s
    @current_url_title = CGI.unescape(@current_url_title) if @current_url_title.start_with?('%')
  end

  def index
    @forms = @content.public_forms
  end

  def show
    @form_answer = @form.form_answers.build(
      answered_url: Page.uri,
      answered_url_title: Page.title,
      remote_addr: request.remote_ip,
      user_agent: request.user_agent
    )

    render_survey_layout
  end

  def confirm_answers
    build_answer

    if @form_answer.form.confirmation?
      render_survey_layout(:show) and return unless @content.use_captcha? ? @form_answer.valid_with_captcha? : @form_answer.valid?
    else
      render_survey_layout(:show) and return unless @content.use_captcha? ? @form_answer.save_with_captcha : @form_answer.save
      send_mail_and_redirect_to_finish and return
    end

    render_survey_layout and return
  end

  def send_answers
    build_answer

    if params[:edit_answers] || !@form_answer.save
      render_survey_layout(:show)
    else
      send_mail_and_redirect_to_finish
    end
  end

  def finish
    render_survey_layout
  end

  private

  def set_form
    forms = Core.mode == 'preview' ? @content.forms : @content.public_forms
    @form = forms.find_by(name: params[:id])
    return http_error(404) unless @form
    return render plain: '' if Core.mode != 'preview' && !@form.state_public?

    Page.current_item = @form
    Page.title = @form.title
  end

  def call_render_public_layout
    render_public_layout unless @piece
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
      Survey::Public::Mailer.survey_receipt(form_answer: @form_answer, from: @content.mail_from, to: mail_to)
                            .deliver_now
    end

    ## send mail to answer
    if @content.auto_reply? && @content.mail_from.present? && @form_answer.reply_to.present?
      Survey::Public::Mailer.survey_auto_reply(form_answer: @form_answer, from: @content.mail_from, to: @form_answer.reply_to)
                            .deliver_now
    end

    prms = "?piece=#{@piece.try(:id)}&u=#{CGI.escape @current_url}&t=#{CGI.escape @current_url_title}"
    if Core.request_uri =~ /^\/_ssl\/([0-9]+).*/
      redirect_to ::File.join(Page.site.full_ssl_uri, "#{@node.public_uri}#{@form_answer.form.name}/finish#{prms}")
    else
      redirect_to "#{@node.public_uri}#{@form_answer.form.name}/finish#{prms}"
    end
  end

  def render_survey_layout(action = action_name)
    return render action: action unless @piece

    head_css = @piece.head_css.to_s
    Page.layout = Cms::Layout.new(
      head:             head_css,
      mobile_head:      head_css,
      smart_phone_head: head_css,
      body:             '[[content]]',
      mobile_body:      '[[content]]',
      smart_phone_body: '[[content]]'
    )
    render action: action, layout: 'layouts/public/base'
  end
end
