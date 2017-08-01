class Tool::Convert::LinkProcessor
  attr_reader :body, :after_body, :clinks

  def initialize(conf)
    @conf = conf
  end

  def sublink(cdoc)
    @body = cdoc.body.dup
    @after_body = cdoc.body.dup
    @clinks = []
    site_url = cdoc.site_url
    host = cdoc.site_url.split('/')[0]

    html = Nokogiri::HTML.fragment(@body)
    html.xpath("./a[@href]|.//a[@href]|./area[@href]|.//area[@href]|./img[@src]|.//img[@src]").each do |e|
      clink = Tool::Convert::Link.new
      clink.cdoc = cdoc
      clink.tag = e.name
      clink.attr = ['a', 'area'].include?(e.name) ? 'href' : 'src'
      clink.url = e[clink.attr].to_s.dup
      clink.after_url = clink.url.dup

      url = clink.url
      next if url.blank?

      uri = normalize_url(url, cdoc.uri_path)
      next if uri.blank?
      next if uri.scheme != 'http' && uri.scheme != 'https'
      next if uri.host != host

      case File.extname(uri.path).downcase
      when '.html', '.htm', '.php', '.asp', ''
        convert_doc_link(uri, clink)
      else
        convert_file_link(uri, clink)
      end

      if clink.url_changed?
        @clinks << clink
        e[clink.attr] = clink.after_url
        e['class'] = "iconFile icon#{clink.ext.capitalize}" if clink.tag == 'a' && clink.filename.present?
        e['onclick'] = e['onclick'].to_s.dup.gsub(clink.url, clink.after_url) if e.attributes['onclick']
      end
    end

    doc = cdoc.latest_doc
    return self unless doc

    @clinks.each do |clink|
      if clink.filename.present? && !doc.files.find_by(name: clink.filename)
        if file = create_file(doc, clink)
          doc.files.push(file)
        end
      end
    end

    doc.body = @after_body = html.inner_html

    doc.in_ignore_accessibility_check = '1'
    doc.in_ignore_link_check = '1'

    unless doc.save
      @conf.dump "記事保存失敗"
      @conf.dump doc.errors.full_messages
    end

    return self
  end

private

  def normalize_url(url, uri_path)
    uri = URI.parse("http://#{uri_path}").merge(url)
    uri.path = '/' unless uri.path
    uri
  rescue => e
    nil
  end

  def convert_doc_link(uri, clink)
    # 他記事へのリンク
    linked_cdoc = Tool::ConvertDoc.in_site(Core.site).where(uri_path: "#{uri.host}#{uri.path}").first
    # 他記事へのリンク(index.html補完)
    if !linked_cdoc && uri.path[-1] == '/'
      linked_cdoc = Tool::ConvertDoc.in_site(Core.site).where(uri_path: "#{uri.host}#{uri.path}index.html").first
    end
    # 他記事へのリンク(.html補完)
    if !linked_cdoc && (!uri.path.include?('.') || uri.path[-4..-1] == '.htm' )
      linked_cdoc = Tool::ConvertDoc.in_site(Core.site).where(uri_path: "#{uri.host}#{uri.path}.html").first
    end

    if linked_cdoc
      clink.after_url = linked_cdoc.doc_public_uri
      clink.after_url += '#' + uri.fragment if uri.fragment
    else
      uri.scheme = uri.host = nil
      clink.after_url = uri.to_s
    end
  end

  def convert_file_link(uri, clink)
    file_path = "#{Tool::Convert::SITE_BASE_DIR}#{URI.unescape(uri.to_s).gsub(%r{^\w+://}, '')}"

    if File.file?(file_path)
      clink.file_path = file_path
      clink.ext = File.extname(uri.path).gsub(/^\./, '')
      clink.filename = "#{uri.host}#{uri.path}".sub(/^\//, "").gsub(/\/|\.|\(|\)/, "_").gsub(/_#{clink.ext}$/i, ".#{clink.ext}")
      clink.filename = "#{clink.cdoc.doc_name}_#{clink.filename}"
      clink.after_url = "file_contents/#{clink.filename}"
    else
      @conf.dump "ファイル検索失敗: #{file_path}"
    end
  end

  def create_file(doc, clink)
    file = Sys::File.new
    file.file = Sys::Lib::File::NoUploadedFile.new(clink.file_path, :skip_image => true)
    file.site_id = doc.content.site_id if doc.content
    file.file_attachable = doc
    file.name = clink.filename
    file.title = clink.filename
    file.build_creator(doc.creator.attributes.except('id'))

    unless file.save
      @conf.dump "ファイル保存失敗: #{clink.file_path}"
      @conf.dump file.errors.full_messages
    end
  end
end
