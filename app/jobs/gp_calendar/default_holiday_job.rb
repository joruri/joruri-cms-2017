class GpCalendar::DefaultHolidayJob < ApplicationJob
  def perform(content_id)
    content = GpCalendar::Content::Event.find_by(id: content_id)
    return unless content

    file = "#{Rails.root}/config/holiday.yml"
    return unless File.exist?(file)
    
    year = Time.now.year-1

    yaml = YAML.load_file(file)
    yaml.each do |val|
      if /(\d+)月の第(\d+)(\W+)曜日/ =~ val["date"]
        (year..year+2).each do |y|
          item = content.holidays.build(val)
          item.date = specific_date($1, $2, $3, y)
          item.save
        end
      else
        item = content.holidays.build(val)
        item.date ||= parse_date(val["date"]) || parse_date(val["date"], '%m-%d')
        item.save
      end
    end
  end

  private

  def specific_date(month, times, wday, year = Time.now.year)
    d = Date.new(year, month.to_i, 1)
    i = ["日", "月", "火", "水", "木", "金", "土"].index(wday)
    d = d + (d.wday > i ? (7 + i - d.wday).days : (i - d.wday).abs.days)
    d = d + (7 * (times.to_i - 1)).days
    return d
  end

  def parse_date(datestring, format='%m月%d日')
    Date.strptime(datestring, format)
  rescue
    nil
  end
end
