namespace ZomekiCMS::NAME do
  namespace :cms do
    namespace :link_checks do
      desc 'Check links'
      task :exec => :environment do
        Cms::Site.order(:id).each do |site|
          if site.link_check_hour?(Time.now.hour)
            system("bundle exec rake #{ZomekiCMS::NAME}:cms:link_checks:exec_site SITE_ID=#{site.id} RAILS_ENV=#{Rails.env} &")
          end
        end
      end

      desc 'Check links in specified site'
      task :exec_site => :environment do
        site = Cms::Site.find_by(id: ENV['SITE_ID'])
        Script.run('cms/link_checks/exec', site_id: site.id, lock_by: :site, kill: 12.hours.to_i) if site
      end
    end

    namespace :nodes do
      desc 'Publish nodes'
      task :publish => :environment do
        next if Zomeki.config.application['cms.file_publisher'] == false
        Rake::Task["#{ZomekiCMS::NAME}:cms:nodes:publish_daily"].invoke
        Rake::Task["#{ZomekiCMS::NAME}:cms:nodes:publish_monthly"].invoke if Date.today.day == 1
        Cms::Site.order(:id).pluck(:id).each do |site_id|
          Script.run('cms/nodes/publish', site_id: site_id, lock_by: :site)
        end
      end

      task :publish_daily => :environment do
        Cms::Site.order(:id).pluck(:id).each do |site_id|
          node_ids = Cms::Node.public_state.where(site_id: site_id, model: 'GpCalendar::TodaysEvent').pluck(:id)
          Script.run("cms/nodes/publish", site_id: site_id, target_node_id: node_ids, lock_by: :site) if node_ids.present?
        end
      end

      task :publish_monthly => :environment do
        Cms::Site.order(:id).pluck(:id).each do |site_id|
          node_ids = Cms::Node.public_state.where(site_id: site_id, model: 'BizCalendar::Place').pluck(:id)
          Script.run("cms/nodes/publish", site_id: site_id, target_node_id: node_ids, lock_by: :site) if node_ids.present?
        end
      end
    end

    namespace :talks do
      desc 'Exec talk tasks'
      task :exec => :environment do
        next if Zomeki.config.application['cms.file_publisher'] == false
        Cms::Site.order(:id).pluck(:id).each do |site_id|
          Script.run('cms/talk_tasks/exec', site_id: site_id, lock_by: :global)
        end
      end
    end

    namespace :file_transfers do
      desc 'Exec file transfers'
      task :exec => :environment do
        next unless Zomeki.config.application['cms.file_transfer']
        Cms::Site.order(:id).pluck(:id).each do |site_id|
          Script.run('cms/file_transfers/exec', site_id: site_id, lock_by: :site)
        end
      end
    end

    namespace :sites do
      desc 'Update server configs'
      task :update_server_configs => :environment do
        out1 = `bundle exec rails g cms:nginx:site_config --force`
        puts out1
        out2 = `bundle exec rails g cms:apache:site_config --force`
        puts out2
        if (out1 + out2) =~ /^\s*(force|create|remove)/
          FileUtils.touch Rails.root.join('tmp/reload_servers.txt')
        end
      end
    end

    namespace :data_files do
      desc 'Rebuild data files (SITE_ID=int)'
      task :rebuild => :environment do
        items = Cms::DataFile.where(state: 'public')
        items = items.in_site(ENV['SITE_ID']) if ENV['SITE_ID']
        items.find_each(&:upload_public_file)
      end
    end

    namespace :brackets do
      desc 'Rebuild brackets (SITE_ID=int)'
      task :rebuild => :environment do
        models = Cms::Bracket.group(:owner_type).pluck(:owner_type).map(&:constantize)
        models.each do |model|
          items = model
          items = items.in_site(ENV['SITE_ID']) if ENV['SITE_ID']
          items.find_each(&:save_brackets)
        end
      end
    end

    namespace :links do
      desc 'Rebuild links (SITE_ID=int)'
      task :rebuild => :environment do
        models = Cms::Link.group(:linkable_type)
                          .pluck(:linkable_type)
                          .map { |type| type.sub('Cms::Node', 'Cms::Node::Page').constantize }
        models.each do |model|
          items = model
          items = items.in_site(ENV['SITE_ID']) if ENV['SITE_ID']
          items.find_each(&:save_links)
        end
      end
    end

    namespace :publish_urls do
      desc 'Rebuild publish urls (SITE_ID=int)'
      task :rebuild => :environment do
        models = Cms::PublishUrl.group(:publishable_type)
                                .pluck(:publishable_type)
                                .map { |type| type.sub('Cms::Node', 'Cms::Node::Page').constantize }
        models.each do |model|
          items = model
          items = items.in_site(ENV['SITE_ID']) if ENV['SITE_ID']
          items.find_each(&:save_publish_urls)
        end
      end
    end

    namespace :search_texts do
      desc 'Rebuild search texts (SITE_ID=int)'
      task :rebuild => :environment do
        models = Cms::SearchText.group(:searchable_type)
                                .pluck(:searchable_type)
                                .map { |type| type.sub('Cms::Node', 'Cms::Node::Page').constantize }
        models.each do |model|
          items = model
          items = items.in_site(ENV['SITE_ID']) if ENV['SITE_ID']
          items = items.where(model: 'Cms::Page') if model == Cms::Node::Page
          items.find_each(&:rebuild_search_texts)
        end
      end
    end
  end
end
