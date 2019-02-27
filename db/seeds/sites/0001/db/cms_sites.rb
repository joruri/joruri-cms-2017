@cms_sites_0 = Cms::Site.new(id: 0)
@cms_sites_1 ||= Cms::Site.create!(
  state: "public",
  name: ENV["NAME"] || 'じょうるり市',
  full_uri: ENV["URL"] || Util::Config.load(:core, :uri) || 'http://sample.cms2017.sitebridge.jp/',
  mobile_full_uri: "",
  portal_group_state: "visible",
  body: "",
  og_type: "",
  og_title: "",
  og_description: "",
  og_image: "",
  smart_phone_publication: "no",
  spp_target: "only_top",
  admin_full_uri: ENV["ADMIN_URL"] || Util::Config.load(:core, :uri) || '',
  smart_phone_layout: "pc",
  mobile_feature: "disabled"
)
@cms_sites_1.copy_common_directory
