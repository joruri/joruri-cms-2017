class Organization::Admin::GroupsController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base

  def pre_dispatch
    @content = Organization::Content::Group.find(params[:content])
    return error_auth unless Core.user.has_priv?(:read, item: @content.concept)
    @parent_sys_group = Core.site.groups.find_by(code: params[:group_id])
    @item = @content.groups.find_by(id: params[:id])
  end

  def index
    sys_group_codes = if @parent_sys_group
                        @parent_sys_group.children.pluck(:code)
                      else
                        @content.top_layer_sys_group_codes
                      end

    @items = @content.groups
                     .where(sys_group_code: sys_group_codes)
                     .paginate(page: params[:page], per_page: params[:limit])
    _index @items
  end

  def show
  end

  def edit
  end

  def update
    @item.attributes = group_params
    _update @item
  end

  private

  def group_params
    params.require(:item).permit(
      :outline, :business_outline, :concept_id, :contact_information,
      :docs_order, :layout_id, :more_layout_id, :sitemap_state, :sort_no, :state,
      :creator_attributes => [:id, :group_id, :user_id]
    )
  end
end
