require 'digest/md5'
module Cms::Model::Base::Page::TalkTask
  extend ActiveSupport::Concern

  included do
    has_many :talk_tasks, class_name: 'Cms::TalkTask', dependent: :destroy, as: :talk_processable
    #after_save :delete_talk_tasks
  end

  def publish_page(content, options = {})
    return false unless super
    return true if options[:dependent].to_s =~ %r{smart_phone$}
    pub = publishers.where(dependent: options[:dependent].to_s).first
    return true unless pub
    return true if pub.path !~ /\.html\z/
    return true unless pub.site.use_talk?
    #return true if !published? && ::File.exist?("#{pub.path}.mp3")

    path = "#{pub.path}.mp3"
    talk = nil
    if published?
      talk = true
    elsif !::File.exist?(path)
      talk = true
    elsif ::File.stat(path).mtime < Cms::KanaDictionary.dic_mtime
      talk = true
    end

    if talk
      task = talk_tasks.find_or_initialize_by(dependent: pub.dependent)
      task.path         = pub.path
      task.content_hash = pub.content_hash
      task.site_id      = pub.site_id
      task.save
    end
    return true
  end

  def close_page(options = {})
    return false unless super
    talk_tasks.destroy_all
    return true
  end

  def delete_talk_tasks
    talk_tasks.destroy_all
    return true
  end
end
