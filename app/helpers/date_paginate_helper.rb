module DatePaginateHelper
  def date_paginate(items, options = {})
    return '' if items.blank?

    defaults = { page_links: false,
                 renderer: LinkRenderer }

    super(items, defaults.deep_merge(options))
  end

  class LinkRenderer < Datewari::Helper::LinkRenderer
    def url(date)
      if Core.request_uri == Core.internal_uri
        super
      else
        page = if date == @paginator.pages.first
                 ''
               else
                 case @paginator.scope
                 when :monthly
                   date.strftime('%Y%m')
                 when :weekly
                   date.strftime('%Y%m%d')
                 else
                   raise "unexpected date pagination scope: #{@paginator.scope}"
                 end
               end
        uri = Page.uri.dup
        uri.gsub!(/\/(\?|$)/, "/index.html\\1")
        uri.gsub!(/\.[0-9]+\.html/, ".html")
        uri.gsub!(/\.html/, ".#{page}.html") if page.present?
        uri
      end
    end
  end
end
