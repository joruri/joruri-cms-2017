class Sys::Lib::Form::Checker
  @links   = nil
  @alts    = nil

  def check_link(text)
    @links ||= {}
    text.scan(/href="([^"]+)"/i).each do |m|
      uri = m[0]
      uri = ::File.join(Core.site.full_uri, uri) if uri =~ /^\//
      next if uri =~ /^(#|mailto:|javascript:)/i
      next if uri !~ /^http:/i
      uri = CGI::unescapeHTML(uri)
      @links[uri] = uri_exists?(uri) unless @links.key?(uri)
    end
    return @links.value?(false) ? false : true
  end

  def uri_exists?(uri)
    require 'open-uri'
    require "resolv-replace"
    require 'timeout'

    ok_code = '200 OK'
    options = {
      :proxy => Core.proxy,
      :progress_proc => lambda {|size| raise ok_code },
      'User-Agent' => "CMS/#{Zomeki.version}"
    }

    begin
      Timeout.timeout(2) do
        open(uri, options) do |f|
          return true if f.status[0].to_i == 200
        end
      end
    rescue Timeout::Error
    rescue => e
      return true if e.to_s == ok_code
    end

    return false
  end

  def errors
    return false if @links && @links.index(false)
    return false if @alts && @alts.index(false)
    return true
  end

  def notice_messages(options = {})
    return nil if @links.blank? && @alts.blank?

    html  = %Q(<div class="noticeExplanation" id="noticeExplanation">)
    html += %Q(<h2>リンクチェック結果</h2>)

    if @links.size > 0
      html += %Q(<p>次のURLを確認しました。</p><ul>)
      @links.each do |uri, res|
        res = res ? %Q(<span class="success">成功</span>) : %Q(<span class="failed">失敗</span>)
        html += %Q(<li>#{uri}　#{res}</li>)
      end
      html += %Q(</ul>)
    end

    if !options[:checkbox].blank? && @links.value?(false)
      html += %Q(<div class="checkbox">#{options[:checkbox]}</div>)
    end

    html += %Q(</div>)
    html.html_safe
  end
end