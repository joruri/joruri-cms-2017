#!/usr/bin/env ruby
DONE_FLAG = "/tmp/#{$0}_done"

puts '#### Configure Joruri ####'
exit if File.exist?(DONE_FLAG)
puts '-- PRESS ENTER KEY --'
gets

require 'fileutils'
require 'yaml/store'

def centos
  puts "It's CentOS!"

  system "su - joruri -c 'cp -p /var/www/joruri/config/original/*.yml /var/www/joruri/config/'"

  core_yml = '/var/www/joruri/config/core.yml'
  db = YAML::Store.new(core_yml)
  db.transaction do
    db['production']['uri'] = "http://#{`hostname`.chomp}/"
  end

  secret = `su - joruri -c 'export LANG=ja_JP.UTF-8; cd /var/www/joruri && bundle exec rake secret RAILS_ENV=production'`
  File.open '/var/www/joruri/config/secrets.yml', File::RDWR do |f|
    f.flock File::LOCK_EX

    conf = f.read
    conf.sub!('<%= ENV["SECRET_KEY_BASE"] %>', secret)

    f.rewind
    f.write conf
    f.flush
    f.truncate f.pos

    f.flock File::LOCK_UN
  end

  smtp_yml = '/var/www/joruri/config/smtp.yml'
  db = YAML::Store.new(smtp_yml)
  db.transaction do
    db['production']['enable_starttls_auto'] = 'false'
  end

  system "su - joruri -c 'export LANG=ja_JP.UTF-8; cd /var/www/joruri && bundle exec rake db:setup RAILS_ENV=production'"
  system "su - joruri -c 'export LANG=ja_JP.UTF-8; cd /var/www/joruri && bundle exec rake db:seed:demo RAILS_ENV=production'"

  system "su - joruri -c 'export LANG=ja_JP.UTF-8; cd /var/www/joruri && bundle exec rake joruri:configure RAILS_ENV=production'"
  system 'ln -s /var/www/joruri/config/nginx/nginx.conf /etc/nginx/conf.d/joruri.conf'
  system 'cp  /etc/nginx/nginx.conf  /etc/nginx/nginx.conf.org'
#######  system '/etc/nginx/nginx.conf'
end

def others
  puts 'This OS is not supported.'
end

if __FILE__ == $0
  if File.exist? '/etc/centos-release'
    centos
  elsif File.exist? '/etc/lsb-release'
    unless `grep -s Ubuntu /etc/lsb-release`.empty?
      puts 'Ubuntu is not yet supported.'
    else
      others
    end
  else
    others
  end

  system "touch #{DONE_FLAG}"
end
