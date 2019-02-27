@sys_sequences_0 = Sys::Sequence.new(id: 0)
@sys_sequences_1 ||= Sys::Sequence.create!(
  name: "gp_article_docs",
  version: 20170421,
  value: 2,
  site_id: @cms_sites_1.id
)
@sys_sequences_2 ||= Sys::Sequence.create!(
  name: "gp_article_doc_serial_no",
  version: <<EOS.chomp,
#{@cms_contents_1.id}
EOS
  value: 12,
  site_id: @cms_sites_1.id
)
@sys_sequences_3 ||= Sys::Sequence.create!(
  name: "gp_article_docs",
  version: 20170425,
  value: 3,
  site_id: @cms_sites_1.id
)
@sys_sequences_4 ||= Sys::Sequence.create!(
  name: "gp_article_docs",
  version: 20170426,
  value: 2,
  site_id: @cms_sites_1.id
)
@sys_sequences_5 ||= Sys::Sequence.create!(
  name: "gp_article_doc_serial_no",
  version: <<EOS.chomp,
#{@cms_contents_11.id}
EOS
  value: 199,
  site_id: @cms_sites_1.id
)
@sys_sequences_6 ||= Sys::Sequence.create!(
  name: "gp_calendar_events",
  version: 20170426,
  value: 1,
  site_id: @cms_sites_1.id
)
@sys_sequences_7 ||= Sys::Sequence.create!(
  name: "gp_article_docs",
  version: 20170427,
  value: 202,
  site_id: @cms_sites_1.id
)
@sys_sequences_8 ||= Sys::Sequence.create!(
  name: "gp_article_doc_serial_no",
  version: <<EOS.chomp,
#{@cms_contents_10.id}
EOS
  value: 15,
  site_id: @cms_sites_1.id
)
@sys_sequences_9 ||= Sys::Sequence.create!(
  name: "gp_article_docs",
  version: 20170428,
  value: 1,
  site_id: @cms_sites_1.id
)
@sys_sequences_10 ||= Sys::Sequence.create!(
  name: "gp_article_docs",
  version: 20170802,
  value: 4,
  site_id: @cms_sites_1.id
)
@sys_sequences_11 ||= Sys::Sequence.create!(
  name: "gp_article_docs",
  version: 20171116,
  value: 2,
  site_id: @cms_sites_1.id
)
@sys_sequences_12 ||= Sys::Sequence.create!(
  name: "gp_article_docs",
  version: 20181005,
  value: 1,
  site_id: @cms_sites_1.id
)
