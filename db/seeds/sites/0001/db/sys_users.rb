@sys_users_0 = Sys::User.new(id: 0)
@sys_users_1 ||= Sys::User.create!(
  state: "enabled",
  ldap: 0,
  auth_no: 5,
  name: "システム管理者",
  name_en: "",
  account: "joruri",
  password: "joruri",
  email: "",
  admin_creatable: true,
  site_creatable: true
)
@sys_users_7 ||= Sys::User.create!(
  state: "enabled",
  ldap: 0,
  auth_no: 5,
  name: "サイト管理者",
  name_en: "admin",
  account: "admin",
  password: "admin",
  email: "",
  admin_creatable: false,
  site_creatable: false
)
@sys_users_8 ||= Sys::User.create!(
  state: "enabled",
  ldap: 0,
  auth_no: 4,
  name: "総務課サイト更新者",
  name_en: "somu2",
  account: "somu2",
  password: "somu2",
  email: "",
  admin_creatable: false,
  site_creatable: false
)
@sys_users_9 ||= Sys::User.create!(
  state: "enabled",
  ldap: 0,
  auth_no: 2,
  name: "総務課記事作成者",
  name_en: "somu1",
  account: "somu1",
  password: "somu1",
  email: "",
  admin_creatable: false,
  site_creatable: false
)
@sys_users_10 ||= Sys::User.create!(
  state: "enabled",
  ldap: 0,
  auth_no: 2,
  name: "防災課記事作成者",
  name_en: "bosai1",
  account: "bosai1",
  password: "bosai1",
  email: "",
  admin_creatable: false,
  site_creatable: false
)
@sys_users_11 ||= Sys::User.create!(
  state: "enabled",
  ldap: 0,
  auth_no: 4,
  name: "総務課承認者",
  name_en: "somu3",
  account: "somu3",
  password: "somu3",
  email: "",
  admin_creatable: false,
  site_creatable: false
)
@sys_users_12 ||= Sys::User.create!(
  state: "enabled",
  ldap: 0,
  auth_no: 4,
  name: "防災課サイト更新者",
  name_en: "bosai2",
  account: "bosai2",
  password: "bosai2",
  email: "",
  admin_creatable: false,
  site_creatable: false
)
@sys_users_13 ||= Sys::User.create!(
  state: "enabled",
  ldap: 0,
  auth_no: 4,
  name: "防災課承認者",
  name_en: "bosai3",
  account: "bosai3",
  password: "bosai3",
  admin_creatable: false,
  site_creatable: false
)
