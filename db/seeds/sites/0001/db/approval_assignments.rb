@approval_assignments_0 = Approval::Assignment.new(id: 0)
Approval::Assignment.create!(
  assignable_id: @approval_approvals_1.id,
  assignable_type: "Approval::Approval",
  or_group_id: 0,
  group_id: @sys_groups_0.id,
  assign_type: "group_users"
)
Approval::Assignment.create!(
  assignable_id: @approval_approvals_1.id,
  assignable_type: "Approval::Approval",
  user_id: @sys_users_7.id,
  or_group_id: 0,
  assign_type: "user"
)
Approval::Assignment.create!(
  assignable_id: @approval_approvals_1.id,
  assignable_type: "Approval::Approval",
  user_id: @sys_users_1.id,
  or_group_id: 0,
  assign_type: "user"
)
