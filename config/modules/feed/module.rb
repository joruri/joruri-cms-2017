Cms::Lib::Modules::ModuleSet.draw :feed, 'フィード', 140 do |mod|
  ## contents
  mod.content :feeds, 'フィード', publishable: true

  ## directories
  mod.directory :feed_entries, '新着記事一覧'

  ## pieces
  mod.piece :feed_entries, '新着記事一覧'

  ## public models
  mod.public_model :feeds
  mod.public_model :feed_entries
end
