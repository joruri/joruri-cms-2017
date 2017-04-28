Rails.application.eager_load!

# remove all callbacks
ApplicationRecord.descendants.each do |model|
  [:validate, :create, :update, :save, :destroy].each do |callback_type|
    model.reset_callbacks(callback_type)
  end
end

# reset
load "#{Rails.root}/db/seeds/reset.rb"

# load db data
[:sys, :cms, :ad_banner, :approval, :gnav, :gp_article, :gp_calendar, :gp_category, :organization, :survey, :tag].each do |mod|
  load "#{Rails.root}/db/seeds/demo/#{mod}.rb"
end

# reset sequences
ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.reset_pk_sequence!(table)
end

# rename site
Cms::Site.first.update_columns(
  name: Util::Config.load(:core, :title),
  full_uri: Util::Config.load(:core, :uri),
  google_map_api_key: Util::Config.load(:core, :map_key)
)

# copy files
src_path = Rails.root.join("db/seeds/demo/sites")
dst_path = Rails.root.join("sites")
::FileUtils.cp_r(Dir.glob(%Q(#{src_path}/*)), dst_path) if ::File.exists?(src_path)

# publish data files
Rake::Task['zomeki:cms:data_files:rebuild'].invoke

# copy _common directory
Rake::Task['zomeki:maintenance:common_dir:copy'].invoke
