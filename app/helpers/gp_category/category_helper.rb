module GpCategory::CategoryHelper
  def category_module_more_link(template_module: nil, ct_or_c: nil, category_name: nil, group_code: nil)
    file = "more@#{template_module.name}"
    file << "@c_#{category_name}" if category_name.present?
    file << "@g_#{group_code}" if group_code.present?
    "#{ct_or_c.public_uri}#{file}.html"
  end
end
