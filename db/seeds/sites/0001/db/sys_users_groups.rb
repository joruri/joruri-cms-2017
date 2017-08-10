@sys_users_groups_0 = Sys::UsersGroup.new(id: 0)
@sys_users_groups_1 ||= Sys::UsersGroup.create!(
  user_id: @sys_users_1.id,
  group_id: @sys_groups_13.id
)
@sys_users_groups_7 ||= Sys::UsersGroup.create!(
  user_id: @sys_users_7.id,
  group_id: @sys_groups_13.id
)
@sys_users_groups_8 ||= Sys::UsersGroup.create!(
  user_id: @sys_users_8.id,
  group_id: @sys_groups_4.id
)
@sys_users_groups_9 ||= Sys::UsersGroup.create!(
  user_id: @sys_users_9.id,
  group_id: @sys_groups_4.id
)
@sys_users_groups_10 ||= Sys::UsersGroup.create!(
  user_id: @sys_users_10.id,
  group_id: @sys_groups_7.id
)
@sys_users_groups_11 ||= Sys::UsersGroup.create!(
  user_id: @sys_users_11.id,
  group_id: @sys_groups_4.id
)
@sys_users_groups_12 ||= Sys::UsersGroup.create!(
  user_id: @sys_users_12.id,
  group_id: @sys_groups_7.id
)
@sys_users_groups_13 ||= Sys::UsersGroup.create!(
  user_id: @sys_users_13.id,
  group_id: @sys_groups_7.id
)
