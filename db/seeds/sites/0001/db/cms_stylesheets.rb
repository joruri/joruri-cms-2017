@cms_stylesheets_0 = Cms::Stylesheet.new(id: 0)
@cms_stylesheets_1 ||= Cms::Stylesheet.create!(
  site_id: @cms_sites_1.id,
  path: "css/site-color"
)
