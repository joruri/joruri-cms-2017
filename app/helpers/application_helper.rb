module ApplicationHelper
  ## query string
  def query(params = nil)
    Util::Http::QueryString.get_query(params)
  end

  ## nl2br
  def br(str)
    str.gsub(/\r\n|\r|\n/, '<br />')
  end

  ## nl2br and escape
  def hbr(str)
    str = html_escape(str)
    str.gsub(/\r\n|\r|\n/, '<br />').html_safe
  end

  ## safe calling
  def safe(alt = nil, &block)
    begin
      yield
#    rescue PassiveRecord::RecordNotFound => e
    rescue NoMethodError => e
      # nil判定を追加
      #if e.respond_to? :args and (e.args.nil? or (!e.args.blank? and e.args.first.nil?))
        alt
      #else
        # 原因がnilクラスへのアクセスでない場合は例外スロー
      #  raise
      #end
    end
  end

  ## paginates
  def paginate(items, options = {})
    return '' unless items
    lang = options[:lang].presence || :ja
    defaults = {
      :params         => params.merge(jpmobile: nil),
      :previous_label => I18n.t("will_paginate.previous_label", {locale: lang}),
      :next_label     => I18n.t("will_paginate.next_label", {locale: lang}),
      :link_separator => '<span class="separator"> | </span' + "\n" + '>'
    }
    if request.mobile?
      defaults[:page_links]     = false
      defaults[:previous_label] = I18n.t("will_paginate.mobile_previous_label", {locale: lang})
      defaults[:next_label]     = I18n.t("will_paginate.mobile_next_label", {locale: lang})
    end
    defaults[:previous_label] = options[:prev_label] if options[:prev_label].present?
    defaults[:next_label]     = options[:next_label] if options[:next_label].present?
    links = will_paginate(items, defaults.deep_merge!(options))
    return links if links.blank?

    if Core.request_uri != Core.internal_uri
      links.gsub!(/href="(#{URI.encode Core.internal_uri}[^"]+|#{URI.encode File.dirname(Core.internal_uri)}[^"]+)/m) do |m|
        page = m =~ /(\?|\&amp;)page=([0-9]+)/ ? m.gsub(/.*(\?|\&amp;)page=([0-9]+).*/, '\\2') : 1
        uri  = m.gsub(/^href="(#{URI.encode Core.internal_uri}|#{URI.encode Core.internal_uri.gsub(/\.html/,'')}|#{URI.encode File.dirname(Core.internal_uri)})/, URI.encode(Page.uri))
        uri.gsub!(/\/(\?|$)/, "/index.html\\1")
        uri.gsub!(/\.p[0-9]+\.html/, ".html")
        uri.gsub!(/\.html/, ".p#{page}.html") if page.to_i > 1
        uri.gsub!(/\&amp;page=\d+/, '')
        uri.gsub!(/\?page=\d+/, '?')
        uri.sub!(/\?\z/, '')
        %Q(href="#{uri})
      end
    end
    if request.mobile?
      links.gsub!(/<a [^>]*?rel="prev( |")/) {|m| m.gsub(/<a /, '<a accesskey="*" ')}
      links.gsub!(/<a [^>]*?rel="next( |")/) {|m| m.gsub(/<a /, '<a accesskey="#" ')}
    end
    links.html_safe
  end

  ## number format
  def number_format(num)
    number_to_currency(num, :unit => '', :precision => 0)
  end

  ## furigana
  def ruby(str, ruby = nil)
    ruby = Page.ruby unless ruby
    return ruby == true ? Cms::Lib::Navi::Kana.convert(str) : str
  end

  def i18n_l(value, format=nil)
    return value if value.nil?
    if format.nil?
      I18n.l value
    else
      I18n.l value, format: format
    end
  end

  def i18n_view(path)
    I18n.t("view.#{controller.controller_path}.#{path}")
  end

  def menu_header(*texts, with_action_name: true)
    header = texts.compact.join(' ：  ')
    header << I18n.t("actions.#{action_name}", default: '') if with_action_name
    header
  end
end
