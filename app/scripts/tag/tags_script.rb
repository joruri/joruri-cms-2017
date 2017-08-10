class Tag::TagsScript < PublicationScript
  def publish
    publish_more(@node, uri: @node.public_uri,
                        path: @node.public_path,
                        smart_phone_path: @node.public_smart_phone_path)

    tags = @node.content.tags
    tags = tags.where(id: params[:target_tag_id]) if params[:target_tag_id].present? 
    tags.each do |tag|
      next if tag.public_docs.blank?
      publish_more(tag, uri: tag.public_uri,
                        path: CGI::unescape(tag.public_path),
                        smart_phone_path: CGI::unescape(tag.public_smart_phone_path))
    end
  end
end
