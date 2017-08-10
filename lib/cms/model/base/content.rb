module Cms::Model::Base::Content
  def states
    [['公開','public'],['非公開','closed']]
  end

  def module_name(option = nil)
    name = Cms::Lib::Modules.model_name(:content, model)
    return name.to_s.gsub(/.*\//, '') if option == :short
    name
  end

  def public_path
    id_dir  = Util::String::CheckDigit.check(format('%07d', id)).gsub(/(.*)(..)(..)(..)$/, '\1/\2/\3/\4/\1\2\3\4')
    "#{site.public_path}/_contents/#{id_dir}"
  end

  def public_uri(class_name)
    return nil unless node = Cms::Node.where(content_id: id, model: class_name.to_s).order(:id).first
    node.public_uri
  end

  def admin_uri
    controller = model.underscore.pluralize.gsub(/^(.*?\/)/, "\\1c#{concept_id}/#{id}/")
    "#{Core.uri}#{ZomekiCMS::ADMIN_URL_PREFIX}/#{controller}"
  end

  def admin_content_uri
    controller = model.to_s.underscore.pluralize.gsub(/^(.*?)\/.*/, "\\1/c#{concept_id}/content_base") + "/#{id}"
    "#{Core.uri}#{ZomekiCMS::ADMIN_URL_PREFIX}/#{controller}"
  end
end
