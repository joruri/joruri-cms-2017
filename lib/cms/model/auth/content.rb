module Cms::Model::Auth::Content
  def creatable?
    return false unless Core.user.has_auth?(:designer)
    return content && Core.user.has_priv?(:create, item: content.concept, site_id: content.site_id)
  end
  
  def readable?
    return false unless Core.user.has_auth?(:designer)
    return content && Core.user.has_priv?(:read, item: content.concept, site_id: content.site_id)
  end
  
  def editable?
    return false unless Core.user.has_auth?(:designer)
    return content && Core.user.has_priv?(:update, item: content.concept, site_id: content.site_id)
  end

  def deletable?
    return false unless Core.user.has_auth?(:designer)
    return content && Core.user.has_priv?(:delete, item: content.concept, site_id: content.site_id)
  end
end
