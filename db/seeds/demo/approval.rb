Approval::ApprovalFlow.create!([
  {id: 1, content_id: 4, title: "承認フロー", group_id: nil, sort_no: 10}
])
Approval::Approval.create!([
  {id: 1, approval_flow_id: 1, index: 0, approval_type: "fix"}
])
Approval::Assignment.create!([
  {id: 1, assignable_id: 1, assignable_type: "Approval::Approval", user_id: nil, approved_at: nil, or_group_id: 0, selected_index: nil, group_id: 0, assign_type: "group_users"},
  {id: 2, assignable_id: 1, assignable_type: "Approval::Approval", user_id: 7, approved_at: nil, or_group_id: 0, selected_index: nil, group_id: nil, assign_type: "user"},
  {id: 3, assignable_id: 1, assignable_type: "Approval::Approval", user_id: 1, approved_at: nil, or_group_id: 0, selected_index: nil, group_id: nil, assign_type: "user"}
])
