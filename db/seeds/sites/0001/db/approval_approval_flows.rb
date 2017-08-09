@approval_approval_flows_0 = Approval::ApprovalFlow.new(id: 0)
@approval_approval_flows_1 ||= Approval::ApprovalFlow.create!(
  content_id: @cms_contents_4.id,
  title: "承認フロー",
  sort_no: 10
)
