class Core
  ## Core attributes.
  cattr_reader   :now
  cattr_reader   :config
  cattr_reader   :title
  cattr_reader   :env
  cattr_reader   :params
  cattr_reader   :mode
  cattr_reader   :site
  cattr_reader   :script_uri
  cattr_reader   :request_uri
  cattr_reader   :internal_uri
  cattr_accessor :ldap
  cattr_accessor :user
  cattr_accessor :user_group
  cattr_accessor :dispatched
  cattr_accessor :concept
  cattr_accessor :messages

  ## Initializes.
  def self.initialize(env = {})
    @@now          = Time.now.to_s(:db)
    @@config       = Util::Config.load(:core)
    @@title        = @@config['title'] || 'CMS'
    @@env          = env
    @@params       = parse_query_string(env)
    @@mode         = nil
    @@site         = nil
    @@script_uri   = "#{env['rack.url_scheme']}://#{env['HTTP_X_FORWARDED_HOST'].presence || env['HTTP_HOST']}#{env['REQUEST_URI'].presence || env['PATH_INFO']}"
    @@request_uri  = nil
    @@internal_uri = nil
    @@ldap         = nil
    @@user         = nil
    @@user_group   = nil
    @@dispatched   = nil
    @@concept      = nil
    @@messages     = []

    #require 'page'
    Page.initialize
  end

  ## Now.
  def self.now
    return @@now if @@now
    return @@now = Time.now.to_s(:db)
  end

  ## Absolute path.
  def self.uri
    return '/' unless @@config['uri'].match(/^[a-z]+:\/\/[^\/]+\//)
    @@config['uri'].sub(/^[a-z]+:\/\/[^\/]+\//, '/')
  end

  ## Full URI.
  def self.full_uri
    @@config['uri']
  end

  ## Proxy.
  def self.proxy
    @@config['proxy']
  end

  ## Parses query string.
  def self.parse_query_string(env)
    env['QUERY_STRING'] ? CGI.parse(env['QUERY_STRING']) : nil
  end

  ## Sets the mode.
  def self.set_mode(mode)
    old = @@mode
    @@mode = mode
    return old
  end

  ## LDAP.
  def self.ldap
    return @@ldap if @@ldap
    @@ldap = Sys::Lib::Ldap.new()
  end

  ## Controller was dispatched?
  def self.dispatched?
    @@dispatched
  end

  ## Controller was dispatched.
  def self.dispatched
    @@dispatched = true
  end

  ## Recognizes the path for dispatch.
  def self.recognize_path(path)
    if Core.env['REQUEST_URI']
      path += '/' if path !~ /\/$/ && Core.env['REQUEST_URI'] =~ /\/$/
    end

    Page.error    = false
    Page.uri      = path
    @@request_uri = path

    self.recognize_mode
    self.recognize_site

    @@internal_uri = '/404.html' unless @@internal_uri
  end

  def self.search_node(path)
    return nil unless Page.site

    if path =~ /\.html\.r$/
      Page.ruby = true
      path = path.gsub(/\.r$/, '')
    end
    if path =~ /\.p[0-9]+\.html$/
      path = path.gsub(/\.p[0-9]+\.html$/, '.html')
    elsif path =~ /\.([0-9]{6}|[0-9]{8})\.html$/
      path = path.gsub(/\.[0-9]+\.html$/, '.html')
    end
    if path =~ /\/$/
      path += 'index.html'
    end

    ## public
    if path =~ /^\/_(common|themes|files)\//
      return @@internal_uri = path
    end
    ## layout preview
    if path =~ /^\/\*\.html(|\.r)$/
      return @@internal_uri = '/_public/cms/node_preview/'
    end
    ## piece
    if path =~ /^\/_pieces\//
      return @@internal_uri = path
    end

    node     = nil
    rest     = ''
    paths    = path.gsub(/\/+/, '/').split('/')
    paths[0] = '/'

    paths.size.times do |i|
      if i == 0
        current = Cms::Node.find(Page.site.node_id)
      else
        arel = Cms::Node.where(site_id: Page.site.id, parent_id: node.id, name: paths[i])
        arel = arel.public_state unless @@mode == 'preview'
        current = arel.order(:id).first
      end
      break unless current

      node = current
      rest = paths.slice(i + 1, paths.size).join('/')
    end
    return nil unless node

    Page.current_node = node
    @@internal_uri  = "/_public/#{node.model.underscore.pluralize.gsub(/^(.*?\/)/, "\\1node_")}"
    @@internal_uri += "/#{rest}" if !rest.blank?
    @@internal_uri
  end

  def self.concept(key = nil)
    return nil unless @@concept
    key.nil? ? @@concept : @@concept.send(key)
  end

  def self.set_concept(session, concept_id = nil)
    concepts = Core.site.concepts.where(state: 'public')
    if concept_id
      @@concept = concepts.find_by(id: concept_id) || concepts.roots.readable_for(Core.user).first
      session[:cms_concept] = (@@concept ? @@concept.id : nil)
    else
      concept_id = session[:cms_concept]
      @@concept = concepts.find_by(id: concept_id) || concepts.roots.readable_for(Core.user).first
    end
  end

  def self.preview_mode?
    @@mode == 'preview'
  end

private
  def self.recognize_mode
    if @@request_uri =~ %r!^/_[a-z]+(/|$)!
      @@mode = @@request_uri.scan(%r!(?<=^/_)[a-z]+!).first
    elsif @@request_uri =~ %r!^/assets/!
      @@mode = 'asset'
    else
      @@mode = 'public'
    end
  end

  def self.recognize_site
    case @@mode
    when ZomekiCMS::ADMIN_URL_PREFIX.sub(/\A_/, '')
      @@site          = self.get_site_by_cookie || find_site_by_script_uri(@@script_uri) || Cms::Site.order(:id).first
      Page.site       = @@site
      @@internal_uri  = @@request_uri
    when 'preview'
      site_id          = @@request_uri.gsub(/^\/_[a-z]+\/([0-9]+).*/, '\1').to_i
      @@site           = Cms::Site.find(site_id)
      Page.site        = @@site
      Page.mobile      = @@request_uri =~ /^\/_[a-z]+\/([0-9]+)m/
      Page.smart_phone = @@request_uri =~ /^\/_[a-z]+\/([0-9]+)s/
      Page.preview_at  = @@request_uri.scan(/^\/_[a-z]+\/[0-9]+\w{0,1}_([0-9]+)/).flatten.first.to_time rescue nil
      @@internal_uri   = @@request_uri
      @@internal_uri  += "index.html" if @@internal_uri =~ /\/$/
    when 'ssl'
      site_id         = @@request_uri.gsub(/^\/_ssl\/([0-9]+)/, '\1').to_i
      @@site          = Cms::Site.find_by(id: site_id)
      Page.site       = @@site
      @@internal_uri  = search_node @@request_uri.sub(/^\/_ssl\/([0-9]+)/, '')
    when 'public'
      @@site          = find_site_by_script_uri(@@script_uri)
      Page.site       = @@site
      @@internal_uri  = search_node @@request_uri
    when 'pieces'
      @@site          = find_site_by_script_uri(@@script_uri)
      Page.site       = @@site
      @@internal_uri  = search_node @@request_uri
    when 'layouts'
      @@site          = find_site_by_script_uri(@@script_uri)
      Page.site       = @@site
      @@internal_uri  = '/_public/cms/layouts' + @@request_uri.gsub(/.*?_layouts/, '')
    else
      @@site          = find_site_by_script_uri(@@script_uri)
      Page.site       = @@site
      @@internal_uri  = @@request_uri
    end
  end

  def self.get_site_by_cookie
    return Cms::Site.find_by(id: self.get_cookie('cms_site'))
  end

  def self.get_cookie(name)
    cookies = CGI::Cookie.parse(Core.env['HTTP_COOKIE'])
    return cookies[name].value.first if cookies.has_key?(name)
    return nil
  end

  def self.find_site_by_script_uri(uri)
    Cms::Site.all_with_full_uri(uri).first
  end

end
