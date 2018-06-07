Cms::Lib::Modules::ModuleSet.draw :organization, '組織', 80 do |mod|
  ## contents
  mod.content :groups, '組織', publishable: true

  ## directories
  mod.directory :groups, '組織ページ'

  ## pieces
  mod.piece :all_groups, '組織一覧'
  mod.piece :categorized_docs, 'カテゴリ記事一覧'
  mod.piece :business_outlines, '業務内容'
  mod.piece :contact_informations, '連絡先'
  mod.piece :outlines, '組織概要'

  ## public models
  mod.public_model :groups
end
