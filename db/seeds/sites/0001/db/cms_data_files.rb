@cms_data_files_0 = Cms::DataFile.new(id: 0)
@cms_data_files_1 ||= Cms::DataFile.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  published_at: Time.now,
  name: "header-id.gif",
  title: "じょうるり市",
  mime_type: "image/gif",
  size: 2083,
  image_is: 1,
  image_width: 220,
  image_height: 52,
  thumb_width: 120,
  thumb_height: 90,
  thumb_size: 2542,
  alt_text: "じょうるり市"
)
@cms_data_files_1.file = Sys::Lib::File::NoUploadedFile.new("db/seeds/sites/0001/upload/cms/data_files/00/00/00/01/00000001/0000001.dat", mime_type: "image/gif")
@cms_data_files_1.validate_upload_file
@cms_data_files_1.send(:upload_internal_file)
@cms_data_files_1.upload_public_file
@cms_data_files_2 ||= Cms::DataFile.create!(
  site_id: @cms_sites_1.id,
  concept_id: @cms_concepts_1.id,
  state: "public",
  published_at: Time.now,
  name: "joruricity-map.png",
  title: "じょうるり市所在地",
  mime_type: "image/png",
  size: 3958,
  image_is: 1,
  image_width: 184,
  image_height: 128,
  thumb_width: 120,
  thumb_height: 90,
  thumb_size: 5045,
  alt_text: "じょうるり市所在地"
)
@cms_data_files_2.file = Sys::Lib::File::NoUploadedFile.new("db/seeds/sites/0001/upload/cms/data_files/00/00/00/02/00000002/0000002.dat", mime_type: "image/png")
@cms_data_files_2.validate_upload_file
@cms_data_files_2.send(:upload_internal_file)
@cms_data_files_2.upload_public_file
