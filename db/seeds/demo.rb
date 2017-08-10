Rails.application.eager_load!

# remove all callbacks
ApplicationRecord.descendants.each do |model|
  [:validate, :create, :update, :save, :destroy].each do |callback_type|
    model.reset_callbacks(callback_type)
  end
end

# reset
load "db/seeds/reset.rb"

# load demo site
ApplicationRecord.transaction do
  load "db/seeds/sites/0001/seed.rb"
end

puts "-- db:seed:demo success."
