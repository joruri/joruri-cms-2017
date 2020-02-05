module GpCalendar::EventHelper
  def event_replace(event, list_style: '')
    Formatter.new(event).format(list_style, mobile: request.mobile?)
  end

  def event_table_replace(event, range, table_style: '', date_style: '')
    Formatter.new(event, range).format_table(table_style, date_style, mobile: request.mobile?)
  end

  class Formatter < ActionView::Base
    include ::ApplicationHelper
    include ::DateHelper
    include GpArticle::DocHelper
    include GpArticle::DocImageHelper

    def initialize(event, range = [])
      @event = event
      @range = range
    end

    def format(list_style, mobile: false)
      link_options = event_link_options

      list_style.gsub(/@\w+@/, {
        '@title_link@' => replace_title_link(link_options).to_s,
        '@title@' => replace_title.to_s,
        '@category@' => replace_category.to_s
      }).html_safe
    end

    def format_table(table_style, date_style = '', mobile: false)
      link_options = event_link_options

      contents = {
        title_link: -> { replace_title_link(link_options) },
        title: -> { replace_title },
        subtitle: -> { replace_subtitle },
        hold_date: -> { replace_hold_date(date_style) },
        hold_date_all: -> { replace_hold_date_all(date_style) },
        summary: -> { replace_summary },
        unit: -> { replace_unit },
        category: -> { replace_category },
        image_link: -> { replace_image_link(link_options) },
        image: -> { replace_image },
        note: -> { replace_note }
      }

      list_style = content_tag(:tr) do
        table_style.each do |t|
          if t[:data] =~ %r|hold_date|
            class_str = 'date'
            concat content_tag(:td, t[:data].html_safe, class: class_str)
          else
            class_str = t[:data].scan(/@(\w+)@/).flatten.join(' ')
            concat content_tag(:td, t[:data].html_safe, class: class_str)
          end
        end
      end

      list_style = list_style.gsub(/@event{{@(.+)@}}event@/m) { |m| link_to($1.html_safe, link_options[0], class: 'event_link') }
      list_style = list_style.gsub(/@category_type_(.+?)@/) { |m| replace_category_type($1) }
      list_style = list_style.gsub(/@(\w+)@/) { |m| contents[$1.to_sym].try(:call).to_s }
      list_style.html_safe
    end

    private

    def event_link_options
      if @event.doc.present?
        doc_link_options(@event.doc)
      elsif @event.href.present?
        [@event.href, target: @event.target]
      else
        nil
      end
    end

    def replace_title
      content_tag(:span, @event.title)
    end

    def replace_title_link(link_options)
      event_title = if link_options
                      link_to *([@event.title] + link_options)
                    else
                      h @event.title
                    end
      content_tag(:span, event_title)
    end

    def replace_subtitle
      if doc = @event.doc
        content_tag(:span, doc.subtitle)
      end
    end

    def replace_hold_date(date_style)
      html = ''
      @event.periods.each do |period|
        if (period.started_on || period.ended_on) && period.intersect?(@range[0], @range[1])
          started_on = get_date_text(period.started_on, date_style)
          ended_on = get_date_text(period.ended_on, date_style)
          if period.started_on && period.ended_on && period.started_on == period.ended_on
            html << content_tag(:p, content_tag(:span, started_on, class: 'startDate closeDate'))
          elsif period.started_on && period.ended_on
            html << content_tag(:p) do
              content_tag(:span, started_on, class: 'startDate') + 
                content_tag(:span, '～', class: 'from') + 
                content_tag(:span, ended_on, class: 'closeDate')
            end
          elsif period.started_on
            html << content_tag(:p, content_tag(:span, started_on, class: 'startDate'))
          elsif period.ended_on
            html << content_tag(:p, content_tag(:span, ended_on, class: 'closeDate'))
          end
        end
      end

      html.html_safe
    end

    def replace_hold_date_all(date_style)
      all_days = @event.periods.map { |period| [period.started_on, period.ended_on] }.flatten.compact
      return '' if all_days.blank?

      min = all_days.min
      max = all_days.max

      if min && max
        started_on = get_date_text(min, date_style)
        ended_on = get_date_text(max, date_style)
        if min == max
          content_tag(:p, content_tag(:span, started_on, class: 'startDate closeDate'))
        else
          content_tag(:span, started_on, class: 'startDate') + 
            content_tag(:span, '～', class: 'from') + 
            content_tag(:span, ended_on, class: 'closeDate')
        end
      else
        ''
      end
    end

    def get_date_text(date, date_style)
      date.strftime(localize_wday(date_style, date.wday))
    end

    def replace_summary
      content_tag(:span, hbr(@event.description))
    end

    def replace_unit
      if doc = @event.doc
        content_tag(:span, doc.creator.group.try(:name)) if doc.creator
      else
        content_tag(:span, @event.creator.group.try(:name)) if @event.creator
      end
    end

    def replace_category
      replace_with_categories(@event.categories.to_a)
    end

    def replace_category_type(category_type_name)
      category_type = GpCategory::CategoryType
        .where(content_id: @event.content.category_content_id, name: category_type_name).first

      if category_type
        category_ids = @event.categories.to_a.map(&:id)
        categories = GpCategory::Category.where(category_type_id: category_type, id: category_ids)
        replace_with_categories(categories)
      end
    end

    def replace_with_categories(categories)
      if categories.present?
        category_tag = "";
        categories.each do |category|
          category_tag += content_tag(:span, category.title, class: category.name)
        end
        category_tag
      end
    end

    def replace_image_link(link_options)
      image_tag = event_image_tag
      image_link =
        if image_tag.present?
          if link_options
            link_to *([image_tag] + link_options)
          else
            image_tag
          end
        else
          image_tag
        end

      if image_link.present?
        content_tag(:span, image_link)
      end
    end

    def replace_image
      image_tag = event_image_tag
      if image_tag.present?
        content_tag(:span, image_tag)
      end
    end

    def event_image_tag
      ei = event_image
      ei.blank? ? '' : ei
    end

    def event_image
      if (doc = @event.doc)
        GpArticle::DocHelper::Formatter.new(doc).format("@image_tag@")
      elsif (file = @event.image_files.first)
        image_tag("#{@event.public_uri}file_contents/#{url_encode file.name}", alt: '')
      elsif @event.content.default_image.present?
        image_tag(@event.content.default_image)
      end
    end

    def replace_note
      if (doc = @event.doc)
        content_tag(:span, hbr(doc.event_note))
      else
        content_tag(:span, hbr(@event.note))
      end
    end
  end
end
