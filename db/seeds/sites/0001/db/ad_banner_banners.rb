@ad_banner_banners_0 = AdBanner::Banner.new(id: 0)
@ad_banner_banners_1 ||= AdBanner::Banner.create!(
  name: "topphoto01.jpg",
  title: "キービジュアル１",
  mime_type: "image/jpeg",
  size: 108526,
  image_is: 1,
  image_width: 1200,
  image_height: 360,
  content_id: @cms_contents_8.id,
  group_id: @ad_banner_groups_1.id,
  state: "public",
  advertiser_name: "じょうるり市",
  advertiser_phone: "",
  advertiser_email: "",
  advertiser_contact: "",
  url: "/",
  sort_no: 10,
  target: "_self",
  site_id: 1,
  thumb_width: 120,
  thumb_height: 90,
  thumb_size: 2138,
  alt_text: "キービジュアル１",
  nofollow: 'enabled',
  lazyload: 'enabled'
)
@ad_banner_banners_1.file = Sys::Lib::File::NoUploadedFile.new(path: "db/seeds/sites/0001/upload/ad_banner/banners/00/00/00/01/00000001/0000001.dat", mime_type: "image/jpeg")
@ad_banner_banners_1.send(:set_upload_file_info)
@ad_banner_banners_1.send(:upload_internal_file)
@ad_banner_banners_1.send(:set_token)
@ad_banner_banners_1.save!
@ad_banner_banners_2 ||= AdBanner::Banner.create!(
  name: "topphoto02.jpg",
  title: "キービジュアル２",
  mime_type: "image/jpeg",
  size: 46577,
  image_is: 1,
  image_width: 1200,
  image_height: 360,
  content_id: @cms_contents_8.id,
  group_id: @ad_banner_groups_1.id,
  state: "public",
  advertiser_name: "じょうるり市",
  advertiser_phone: "",
  advertiser_email: "",
  advertiser_contact: "",
  url: "/",
  sort_no: 20,
  target: "_self",
  site_id: 1,
  thumb_width: 120,
  thumb_height: 90,
  thumb_size: 1941,
  alt_text: "キービジュアル２",
  nofollow: 'enabled',
  lazyload: 'enabled'
)
@ad_banner_banners_2.file = Sys::Lib::File::NoUploadedFile.new(path: "db/seeds/sites/0001/upload/ad_banner/banners/00/00/00/02/00000002/0000002.dat", mime_type: "image/jpeg")
@ad_banner_banners_2.send(:set_upload_file_info)
@ad_banner_banners_2.send(:upload_internal_file)
@ad_banner_banners_2.send(:set_token)
@ad_banner_banners_2.save!
@ad_banner_banners_3 ||= AdBanner::Banner.create!(
  name: "bn-joruri.gif",
  title: "Joruri公式サイト",
  mime_type: "image/gif",
  size: 2126,
  image_is: 1,
  image_width: 170,
  image_height: 50,
  content_id: @cms_contents_8.id,
  group_id: @ad_banner_groups_2.id,
  state: "public",
  advertiser_name: "サイトブリッジ株式会社",
  advertiser_phone: "",
  advertiser_email: "",
  advertiser_contact: "",
  url: "http://joruri.org/",
  sort_no: 100,
  target: "_blank",
  site_id: 1,
  thumb_width: 120,
  thumb_height: 90,
  thumb_size: 2143,
  alt_text: "Joruri公式サイト",
  nofollow: 'enabled',
  lazyload: 'enabled'
)
@ad_banner_banners_3.file = Sys::Lib::File::NoUploadedFile.new(path: "db/seeds/sites/0001/upload/ad_banner/banners/00/00/00/03/00000003/0000003.dat", mime_type: "image/gif")
@ad_banner_banners_3.send(:set_upload_file_info)
@ad_banner_banners_3.send(:upload_internal_file)
@ad_banner_banners_3.send(:set_token)
@ad_banner_banners_3.save!
@ad_banner_banners_4 ||= AdBanner::Banner.create!(
  name: "bn-sitebridge.gif",
  title: "サイトブリッジ株式会社",
  mime_type: "image/gif",
  size: 975,
  image_is: 1,
  image_width: 170,
  image_height: 50,
  content_id: @cms_contents_8.id,
  group_id: @ad_banner_groups_2.id,
  state: "public",
  advertiser_name: "サイトブリッジ株式会社",
  advertiser_phone: "",
  advertiser_email: "",
  advertiser_contact: "",
  url: "http://www.sitebridge.co.jp/",
  sort_no: 300,
  target: "_blank",
  site_id: 1,
  thumb_width: 120,
  thumb_height: 90,
  thumb_size: 1479,
  alt_text: "サイトブリッジ株式会社",
  nofollow: 'enabled',
  lazyload: 'enabled'
)
@ad_banner_banners_4.file = Sys::Lib::File::NoUploadedFile.new(path: "db/seeds/sites/0001/upload/ad_banner/banners/00/00/00/04/00000004/0000004.dat", mime_type: "image/gif")
@ad_banner_banners_4.send(:set_upload_file_info)
@ad_banner_banners_4.send(:upload_internal_file)
@ad_banner_banners_4.send(:set_token)
@ad_banner_banners_4.save!

@ad_banner_banners_5 ||= AdBanner::Banner.create!(
  name: "joruricms2017.png",
  title: "Joruri CMS 2017",
  mime_type: "image/png",
  size: 4234,
  image_is: 1,
  image_width: 170,
  image_height: 50,
  content_id: @cms_contents_8.id,
  group_id: @ad_banner_groups_2.id,
  state: "public",
  advertiser_name: "サイトブリッジ株式会社",
  advertiser_phone: "",
  advertiser_email: "",
  advertiser_contact: "",
  url: "https://joruri-cms.jp/",
  sort_no: 50,
  target: "_blank",
  site_id: 1,
  thumb_width: 120,
  thumb_height: 90,
  thumb_size: 3269,
  alt_text: "Joruri CMS 2017",
  nofollow: 'enabled',
  lazyload: 'enabled'
)
@ad_banner_banners_5.file = Sys::Lib::File::NoUploadedFile.new(path: "db/seeds/sites/0001/upload/ad_banner/banners/00/00/00/05/00000005/0000005.dat", mime_type: "image/png")
@ad_banner_banners_5.send(:set_upload_file_info)
@ad_banner_banners_5.send(:upload_internal_file)
@ad_banner_banners_5.send(:set_token)
@ad_banner_banners_5.save!
