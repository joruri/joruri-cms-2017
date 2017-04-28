GpCalendar::Event.create!([
  {id: 1, content_id: 7, state: "public", started_on: "2017-04-05", ended_on: "2017-04-18", name: "2017042600011", title: "test", href: "", target: "_self", description: "", sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil, sync_source_source_class: nil, will_sync: nil, note: ""}
])
GpCalendar::Holiday.create!([
  {id: 1, content_id: 7, state: "public", title: "元日", date: "2017-01-01", description: "年のはじめを祝う", kind: "holiday", repeat: true, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 2, content_id: 7, state: "public", title: "成人の日", date: "2017-01-09", description: "おとなになったことを自覚し、みずから生き抜こうとする青年を祝いはげます", kind: "holiday", repeat: false, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 3, content_id: 7, state: "public", title: "建国記念の日", date: "2017-02-11", description: "建国をしのび、国を愛する心を養う", kind: "holiday", repeat: true, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 4, content_id: 7, state: "public", title: "春分の日", date: nil, description: "自然をたたえ、生物をいつくしむ", kind: "holiday", repeat: false, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 5, content_id: 7, state: "public", title: "昭和の日", date: "2017-04-29", description: "激動の日々を経て、復興を遂げた昭和の時代を顧み、国の将来に思いをいたす", kind: "holiday", repeat: true, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 6, content_id: 7, state: "public", title: "憲法記念日", date: "2017-05-03", description: "日本国憲法の施行を記念し、国の成長を期する", kind: "holiday", repeat: true, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 7, content_id: 7, state: "public", title: "みどりの日", date: "2017-05-04", description: "自然に親しむとともにその恩恵に感謝し、豊かな心をはぐくむ", kind: "holiday", repeat: true, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 8, content_id: 7, state: "public", title: "こどもの日", date: "2017-05-05", description: "こどもの人格を重んじ、こどもの幸福をはかるとともに、母に感謝する", kind: "holiday", repeat: true, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 9, content_id: 7, state: "public", title: "海の日", date: "2017-07-17", description: "海の恩恵に感謝するとともに、海洋国日本の繁栄を願う", kind: "holiday", repeat: false, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 10, content_id: 7, state: "public", title: "敬老の日", date: "2017-09-18", description: "多年にわたり社会につくしてきた老人を敬愛し、長寿を祝う", kind: "holiday", repeat: false, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 11, content_id: 7, state: "public", title: "秋分の日", date: nil, description: "祖先をうやまい、なくなった人々をしのぶ", kind: "holiday", repeat: false, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 12, content_id: 7, state: "public", title: "体育の日", date: "2017-10-09", description: "スポーツにしたしみ、健康な心身をつちかう", kind: "holiday", repeat: false, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 13, content_id: 7, state: "public", title: "文化の日", date: "2017-11-03", description: "自由と平和を愛し、文化をすすめる", kind: "holiday", repeat: true, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 14, content_id: 7, state: "public", title: "勤労感謝の日", date: "2017-11-23", description: "勤労をたっとび、生産を祝い、国民たがいに感謝しあう", kind: "holiday", repeat: true, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil},
  {id: 15, content_id: 7, state: "public", title: "天皇誕生日", date: "2017-12-23", description: "天皇の誕生日を祝う", kind: "holiday", repeat: true, sync_source_host: nil, sync_source_content_id: nil, sync_source_id: nil}
])
