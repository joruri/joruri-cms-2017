class BizCalendar::Piece::BussinessHoliday < Cms::Piece
  TARGET_TYPE_OPTIONS = [['全て', 'all'], ['次回', 'next']]
  PAGE_FILTER_OPTIONS = [['絞り込む', 'filter'], ['絞り込まない', 'through']]
  PLACE_LINK_OPTIONS = [['あり', 'enabled'], ['なし', 'disabled']]

  default_scope { where(model: 'BizCalendar::BussinessHoliday') }

  belongs_to :content, class_name: 'BizCalendar::Content::Place'

  after_initialize :set_default_settings

  def target_next?
    target_type == 'next'
  end

  def target_type
    setting_value(:target_type).presence || 'all'
  end

  def page_filter
    setting_value(:page_filter).presence || 'filter'
  end

  def link_place_page?
    place_link == 'enabled'
  end

  def place_link
    setting_value(:place_link).presence || 'enabled'
  end

  def date_style
    setting_value(:date_style).presence || '%Y年%m月%d日'
  end

  private

  def set_default_settings
    settings = self.in_settings

    settings['page_filter'] = 'filter' if setting_value(:page_filter).nil?
    settings['date_style'] = '%Y年%m月%d日' if setting_value(:date_style).nil?
    settings['place_link'] = 'enabled' if setting_value(:place_link).nil?

    self.in_settings = settings
  end

end
