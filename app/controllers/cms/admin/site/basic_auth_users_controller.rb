class Cms::Admin::Site::BasicAuthUsersController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base

  after_action :refresh_auth, only: [:create, :update, :destroy]

  def pre_dispatch
    return error_auth unless Core.user.has_auth?(:manager)
    @site = Cms::Site.find(params[:site])
  end

  def index
    @items = @site.basic_auth_users.paginate(page: params[:page], per_page: params[:limit])
    _index @items
  end

  def show
    @item = @site.basic_auth_users.find(params[:id])
    return error_auth unless @item.readable?
    _show @item
  end

  def new
    @item = @site.basic_auth_users.build(state: 'enabled')
  end

  def create
    @item = @site.basic_auth_users.build(basic_auth_user_params)
    _create @item
  end

  def update
    @item = @site.basic_auth_users.find(params[:id])
    @item.attributes = basic_auth_user_params
    _update @item
  end

  def destroy
    @item = @site.basic_auth_users.find(params[:id])
    _destroy @item
  end

  def enable_auth
    @site.enable_basic_auth
    update_configs

    flash[:notice] = 'Basic認証を有効にしました。'
    redirect_to cms_site_basic_auth_users_path(@site)
  end

  def disable_auth
    @site.disable_basic_auth
    update_configs

    flash[:notice] = 'Basic認証を無効にしました。'
    redirect_to cms_site_basic_auth_users_path(@site)
  end

  private

  def refresh_auth
    if @site.basic_auth_users.where(state: 'enabled').empty?
      @site.disable_basic_auth
      flash[:notice] = 'Basic認証を無効にしました。'
    end

    update_configs
  end

  def update_configs
    Rails::Generators.invoke('cms:apache:basic_auth', ['--force', "--site_id=#{@site.id}"])
    Rails::Generators.invoke('cms:nginx:site_config', ['--force', "--site_id=#{@site.id}"])
    Cms::Site.reload_servers

    Cms::FileTransferCallbacks.new(:basic_auth_htpasswd_path).enqueue(@site)
  end

  def basic_auth_user_params
    params.require(:item).permit(
      :name, :password, :state, :target_type, :target_location,
      :creator_attributes => [:id, :group_id, :user_id]
    )
  end
end
