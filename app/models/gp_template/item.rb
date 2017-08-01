class GpTemplate::Item < ApplicationRecord
  include Sys::Model::Base
  include Cms::Model::Site
  include Cms::Model::Auth::Content

  include StateText

  STATE_OPTIONS = [['公開', 'public'], ['非公開', 'closed']]
  ITEM_TYPE_OPTIONS = [['入力/1行（テキストフィールド）', 'text_field'], ['入力/複数行（テキストエリア）', 'text_area'], ['入力/フリー（エディタ付）', 'rich_text'],
                       ['選択/単数回答（プルダウン）', 'select'], ['選択/単数回答（ラジオボタン）', 'radio_button'], ['添付ファイル', 'attachment_file']]

  default_scope { order("#{self.table_name}.sort_no IS NULL, #{self.table_name}.sort_no") }

  belongs_to :template
  validates :template_id, presence: true

  delegate :content, to: :template

  validates :state, presence: true

  validates :title, presence: true
  validates :name, presence: true, uniqueness: { scope: :template_id, case_sensitive: false },
                   format: { with: /\A[-\w]*\z/ }
  validates :item_type, presence: true

  after_initialize :set_defaults

  define_site_scope :template

  scope :public_state, -> { where(state: 'public') }

  def state_public?
    state == 'public'
  end

  def state_closed?
    state == 'closed'
  end

  def item_options_for_select
    item_options.split(/[\r\n]+/)
  end

  def item_type_label
    ITEM_TYPE_OPTIONS.detect{|o| o.last == item_type}.try(:first)
  end

  private

  def set_defaults
    self.state     = STATE_OPTIONS.first.last     if self.has_attribute?(:state) && self.state.nil?
    self.item_type = ITEM_TYPE_OPTIONS.first.last if self.has_attribute?(:item_type) && self.item_type.nil?
    self.sort_no = 10 if self.has_attribute?(:sort_no) && self.sort_no.nil?
  end
end
