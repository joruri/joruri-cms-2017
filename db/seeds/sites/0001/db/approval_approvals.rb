@approval_approvals_0 = Approval::Approval.new(id: 0)
@approval_approvals_1 ||= Approval::Approval.create!(
  approval_flow_id: @approval_approval_flows_1.id,
  index: 0,
  approval_type: "fix"
)
