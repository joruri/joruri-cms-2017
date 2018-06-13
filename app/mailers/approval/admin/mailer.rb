class Approval::Admin::Mailer < ApplicationMailer
  def approval_request(options = {})
    @from = options[:from]
    @to = options[:to]
    @item = options[:item]

    @content = @item.content
    @preview_uri = preview_uri
    @approve_uri = approve_uri

    mail from: @from.email, to: @to.email, subject: "#{subject_prefix}：承認依頼メール"
  end

  def approved_notification(options = {})
    @from = options[:from]
    @to = options[:to]
    @item = options[:item]

    @content = @item.content
    @detail_uri = detail_uri

    mail from: @from.email, to: @to.email, subject: "#{subject_prefix}：承認完了メール"
  end

  def passbacked_notification(options = {})
    @from = options[:from]
    @to = options[:to]
    @item = options[:item]
    @comment = options[:comment]

    @content = @item.content
    @detail_uri = detail_uri

    mail from: @from.email, to: @to.email, subject: "#{subject_prefix}：差し戻しメール"
  end

  def pullbacked_notification(options = {})
    @from = options[:from]
    @to = options[:to]
    @item = options[:item]
    @comment = options[:comment]

    @content = @item.content
    @detail_uri = detail_uri

    mail from: @from.email, to: @to.email, subject: "#{subject_prefix}：引き戻しメール"
  end

  private

  def subject_prefix
    "#{@content.name}（#{@content.site.name}）"
  end

  def preview_uri
    @item.preview_uri
  end

  def detail_uri
    Addressable::URI.join(@item.content.site.main_admin_uri, @item.admin_uri).to_s
  end

  def approve_uri
    Addressable::URI.join(@item.content.site.main_admin_uri, @item.admin_uri(active_tab: 'approval')).to_s
  end
end
