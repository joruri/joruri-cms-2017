module Map::MarkerHelper
  def marker_image(marker)
    if (doc = marker.doc) && doc.content.public_node
      GpArticle::DocHelper::Formatter.new(doc).format("@image_tag@")
    elsif (file = marker.files.first) && marker.content.public_node
      image_tag("#{marker.public_uri}file_contents/#{url_encode file.name}")
    end
  end
end
