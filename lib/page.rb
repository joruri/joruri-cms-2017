class Page
  cattr_accessor :site
  cattr_accessor :uri
  cattr_accessor :layout
  cattr_accessor :content
  cattr_accessor :title
  cattr_accessor :lang
  cattr_accessor :current_node
  cattr_accessor :current_item
  cattr_accessor :current_piece
  cattr_accessor :mobile
  cattr_accessor :smart_phone
  cattr_accessor :preview_at
  cattr_accessor :ruby
  cattr_accessor :error

  def self.initialize
    @@site          = nil
    @@uri           = nil
    @@layout        = nil
    @@content       = nil
    @@title         = nil
    @@lang          = 'ja'
    @@current_node  = nil
    @@current_item  = nil
    @@current_piece = nil
    @@mobile        = nil
    @@smart_phone   = nil
    @@preview_at    = nil
    @@ruby          = nil
    @@error         = nil
  end

  def self.mobile?
    return true if @@mobile
    return false unless @@site
    return false if @@site.mobile_full_uri.blank?
    Core.script_uri.index(@@site.mobile_full_uri) == 0
  end

  def self.smart_phone?
    !!@@smart_phone
  end

  def self.body_id
    return nil unless @@uri
    id = @@uri.gsub(/^\/_.*?\/[0-9]+\//, '/')
    id += 'index.html' if /\/$/ =~ id
    id = id.slice(1, id.size)
    id = id.gsub(/\..*$/, '')
    id = id.gsub(/\.[0-9a-zA-Z]+$/, '')
    id = id.gsub(/[^0-9a-zA-Z_\.\/]/, '_')
    id = id.gsub(/(\.|\/)/, '-').camelize(:lower)
    return %Q(id="page-#{id}").html_safe
  end

  def self.body_class
    return nil unless @@uri
    cls = @@uri.gsub(/^\/_.*?\/[0-9]+\//, '/')
    cls += 'index.html' if /\/$/ =~ cls
    cls = ::File.dirname(cls)
    cls = cls.slice(1, cls.size)
    cls = cls.gsub(/\..*$/, '')
    cls = cls.gsub(/\.[0-9a-zA-Z]+$/, '')
    cls = cls.gsub(/[^0-9a-zA-Z_\.\/]/, '_')
    cls = cls.gsub(/(\.|\/)/, '-').gsub(/\-$/, '')
    return %Q(class="rootdir").html_safe if cls.blank?
    return %Q(class="dir-#{cls.camelize(:lower)}").html_safe
  end
  
  def self.title
    return @@title if @@title
    return Page.current_node.title if Page.current_node
    return @@site.name
  end

  def self.window_title
    return title if title == @@site.name
    return title + ' | ' + @@site.name
  end

  def self.preview_terminal
    mobile? ? 'm' : smart_phone? ? 's' : ''
  end

  def self.agent_type
    mobile? ? :mobile : smart_phone? ? :smart_phone : :pc
  end
end
