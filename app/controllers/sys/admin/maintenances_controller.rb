class Sys::Admin::MaintenancesController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base

  def pre_dispatch
    return error_auth unless Core.user.root?
    @maintenances = Sys::Maintenance
  end

  def index
    @items = @maintenances.order(published_at: :desc)
                          .paginate(page: params[:page], per_page: params[:limit])
    _index @items
  end

  def show
    @item = @maintenances.find(params[:id])
    return error_auth unless @item.readable?
    _show @item
  end

  def new
    @item = @maintenances.new(state: 'public', published_at: Time.now)
  end

  def create
    @item = @maintenances.new(maintenance_params)
    _create @item
  end

  def update
    @item = @maintenances.find(params[:id])
    @item.attributes = maintenance_params
    _update @item
  end

  def destroy
    @item = @maintenances.find(params[:id])
    _destroy @item
  end

  private

  def maintenance_params
    params.require(:item).permit(:body, :published_at, :state, :title)
  end
end
