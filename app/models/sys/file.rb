class Sys::File < ApplicationRecord
  include Sys::Model::Base
  include Sys::Model::Base::File
  include Sys::Model::Base::TextExtraction
  include Sys::Model::Rel::Creator
  include Sys::Model::Auth::Free

  has_many :publishers, class_name: 'Sys::Publisher', dependent: :destroy, as: :publishable
  belongs_to :site, class_name: 'Cms::Site'
  belongs_to :file_attachable, polymorphic: true

  nested_scope :in_site, through: :file_attachable

  def duplicated
    c_tmp_id, c_file_attachable_type, c_file_attachable_id = if tmp_id
                                                               [tmp_id, nil, nil]
                                                             else
                                                               [nil, file_attachable_type, file_attachable_id]
                                                             end
    self.class.where.not(id: id).where(name: name).where(tmp_id: c_tmp_id, file_attachable_type: c_file_attachable_type,
                                                                           file_attachable_id: c_file_attachable_id).first
  end

  def duplicated?
    !!duplicated
  end

  def duplicate(attrs = {})
    new_item = self.class.new(attributes.except('id').merge(attrs))
    new_item.skip_upload

    transaction do
      new_item.save(validate: false)

      if ::File.exist?(upload_path)
        Util::File.put(new_item.upload_path, src: upload_path, mkdir: true)
      end
      if ::File.exist?(upload_path(type: :thumb))
        Util::File.put(new_item.upload_path(type: :thumb), src: upload_path(type: :thumb), mkdir: true)
      end
    end

    new_item
  end

  class << self
    def cleanup
      self.where.not(tmp_id: nil)
          .where(file_attachable_type: nil, file_attachable_id: nil)
          .where(arel_table[:created_at].lt(2.days.ago))
          .destroy_all
    end
  end
end
