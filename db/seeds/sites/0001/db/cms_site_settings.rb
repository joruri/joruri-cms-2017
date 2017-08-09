@cms_site_settings_0 = Cms::SiteSetting.new(id: 0)
@cms_site_settings_1 ||= Cms::SiteSetting.create!(
  site_id: @cms_sites_1.id,
  name: "allowed_attachment_type",
  value: ""
)
@cms_site_settings_2 ||= Cms::SiteSetting.create!(
  site_id: @cms_sites_1.id,
  name: "admin_mail_sender",
  value: "noreply"
)
@cms_site_settings_3 ||= Cms::SiteSetting.create!(
  site_id: @cms_sites_1.id,
  name: "file_upload_max_size",
  value: "5"
)
@cms_site_settings_4 ||= Cms::SiteSetting.create!(
  site_id: @cms_sites_1.id,
  name: "link_check",
  value: "enabled"
)
@cms_site_settings_5 ||= Cms::SiteSetting.create!(
  site_id: @cms_sites_1.id,
  name: "accessibility_check",
  value: "disabled"
)
@cms_site_settings_6 ||= Cms::SiteSetting.create!(
  site_id: @cms_sites_1.id,
  name: "kana_talk",
  value: "disabled"
)
