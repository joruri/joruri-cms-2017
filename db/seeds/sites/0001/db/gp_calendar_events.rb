@gp_calendar_events_0 = GpCalendar::Event.new(id: 0)
@gp_calendar_events_1 ||= GpCalendar::Event.create!(
  content_id: @cms_contents_7.id,
  state: "public",
  started_on: "2017-04-05",
  ended_on: "2017-04-18",
  name: "2017042600011",
  title: "test",
  href: "",
  target: "_self",
  description: "",
  note: ""
)
