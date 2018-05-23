Cms::Lib::Modules::ModuleSet.draw :rank, 'アクセスランキング', 120 do |mod|
  ## contents
  mod.content :ranks, 'アクセスランキング', publishable: true

  ## directories
  mod.directory :previous_days, '前日'
  mod.directory :last_weeks, '先週（月曜日〜日曜日）'
  mod.directory :last_months, '先月'
  mod.directory :this_weeks, '週間（前日から一週間）'

  ## pieces
  mod.piece :ranks, 'アクセスランキング一覧'

  ## public models
  mod.public_model :ranks
  mod.public_model :categories
  mod.public_model :totals
end
