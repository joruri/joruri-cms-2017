class Sys::Admin::MessagesController < Cms::Controller::Admin::Base
  include Sys::Controller::Scaffold::Base

  def pre_dispatch
    return error_auth unless Core.user.has_auth?(:manager)
    @messages = Core.site.messages
  end

  def index
    @items = @messages.order(published_at: :desc)
                      .paginate(page: params[:page], per_page: params[:limit])
    _index @items
  end

  def show
    @item = @messages.find(params[:id])
    return error_auth unless @item.readable?
    _show @item
  end

  def new
    @item = @messages.build(state: 'public', published_at: Time.now)
  end

  def create
    @item = @messages.build(message_params)
    _create @item
  end

  def update
    @item = @messages.find(params[:id])
    @item.attributes = message_params
    _update @item
  end

  def destroy
    @item = @messages.find(params[:id])
    _destroy @item
  end

  private

  def message_params
    params.require(:item).permit(:body, :published_at, :state, :title)
  end
end
