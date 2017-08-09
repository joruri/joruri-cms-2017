# encoding: utf-8
## ---------------------------------------------------------
## load config

# reset
load "db/seeds/reset.rb"

@site = Cms::Site.create!(
  :state              => 'public',
  :name               => Util::Config.load(:core, :uri),
  :full_uri           => Util::Config.load(:core, :title),
  :google_map_api_key => Util::Config.load(:core, :map_key)
)

load "db/seeds/initialize/base.rb"
puts "-- db:seed success."
