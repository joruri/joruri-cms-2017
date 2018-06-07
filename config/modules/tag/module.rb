Cms::Lib::Modules::ModuleSet.draw :tag, '関連ワード', 40 do |mod|
  ## contents
  mod.content :tags, '関連ワード', publishable: true

  ## directories
  mod.directory :tags, '関連ワードページ'

  ## pieces
  mod.piece :tags, '関連ワード一覧'

  ## public models
  mod.public_model :tags
end
