@cms_periods_0 = Cms::Period.new(id: 0)
Cms::Period.create!(
  periodable_type: "GpArticle::Doc",
  periodable_id: @gp_article_docs_555.id,
  started_on: "2017-04-05",
  ended_on: "2017-04-27"
)
Cms::Period.create!(
  periodable_type: "GpArticle::Doc",
  periodable_id: @gp_article_docs_529.id,
  started_on: "2017-08-01",
  ended_on: "2017-08-01"
)
Cms::Period.create!(
  periodable_type: "GpCalendar::Event",
  periodable_id: @gp_calendar_events_1.id,
  started_on: "2017-04-05",
  ended_on: "2017-04-18"
)
