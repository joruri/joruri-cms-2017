module Sys::Model::Auth::EditableGroup
  extend ActiveSupport::Concern

  def creatable?
    return false unless Core.user.has_auth?(:creator)
    #return Core.user.has_priv?(:create, :item => content.concept)
    return true
  end

  def editable?
    return true if Core.user.has_auth?(:manager)
    return false unless creator
    return true if creator.group_id == Core.user_group.id
    return editable_groups.any? { |eg| eg.all_group? || eg.group_id == Core.user_group.id }
  end

  def deletable?
    editable?
  end

  class_methods do
    def editable
      if Core.user.has_auth?(:manager)
        all
      else
        creators = Sys::Creator.arel_table
        editable_groups = Sys::EditableGroup.arel_table
        distinct.joins(:creator).left_joins(:editable_groups).where([
          creators[:group_id].eq(Core.user_group.id),
          editable_groups[:group_id].in([Core.user_group.id, Sys::EditableGroup::ALL_GROUP])
        ].reduce(:or))
      end
    end
  end
end
