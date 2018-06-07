class Feed::FeedEntry < ApplicationRecord
  include Sys::Model::Base
  include Cms::Model::Auth::Content

  default_scope { order(created_at: :desc) }

  enum_ish :state, [:public, :closed], default: :public

  # Content
  belongs_to :content, class_name: 'Feed::Content::Feed', required: true

  belongs_to :feed, class_name: 'Feed::Feed'

  nested_scope :in_site, through: :feed

  def source_title
    return @source_title if @source_title
    if feed
      @source_title = feed.title
    else
      @source_title = nil
    end
  end

  def link_target
    feed ? "_blank" : nil
  end
  
  def new_mark
    term = content.setting_value(:new_term)
    return false if term =~ /^0(\s|$)/i

    if (term == nil || term =~ /^[\s|]*$/)
      term = 14
    end
    term = term.to_f * 60
    return false if term <= 0

    published_at = term.minutes.since self.entry_updated
    return ( published_at.to_i >= Time.now.to_i )
  end
  
  def date_and_site(options = {})
    values = []
    
    if options[:date] != false
      values << %Q(<span class="date">#{entry_updated.strftime('%Y年%-m月%-d日')}</span>) if entry_updated
    end
    
    if !source_title.blank?
      values << %Q(<span class="site">#{ERB::Util.html_escape(source_title)}</span>)
    elsif content
      suffix = content.setting_value(:doc_list_suffix)
      if suffix == "site"
        values << %Q(<span class="site">#{ERB::Util.html_escape(content.site.name)}</span>) if content.site
      end
    end
    
    return "" if values.size == 0
    
    separator = %Q(<span class="separator">　</span>)
    %Q(<span class="attributes">（#{values.join(separator)}）</span>).html_safe
  end

  def public_uri
    return nil unless self.link_alternate
    self.link_alternate
  end

  def public_full_uri
    return nil unless self.link_alternate
    self.link_alternate
  end

  def agent_filter(agent)
    self
  end
end
