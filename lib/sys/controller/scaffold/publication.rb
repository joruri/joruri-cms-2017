module Sys::Controller::Scaffold::Publication

  def publish(item)
    _publish(item)
  end

  def close(item)
    _close(item)
  end

protected
  def _publish(item, options = {}, &block)
    if item.publishable? && item.publish
      location       = options[:location] || url_for(:action => :index)
      flash[:notice] = options[:notice] || '公開処理が完了しました。'
      Sys::OperationLog.log(request, :item => item)
      yield if block_given?
      respond_to do |format|
        format.html { redirect_to(location) }
        format.xml  { head :ok }
      end
    else
      flash[:alert] = '公開処理に失敗しました。'
      respond_to do |format|
        format.html { redirect_to url_for(:action => :show) }
        format.xml  { render :xml => item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def _close(item, options = {}, &block)
    if item.closable? && item.close
      location       = options[:location] || url_for(:action => :index)
      flash[:notice] = options[:notice] || '非公開処理が完了しました。'
      Sys::OperationLog.log(request, :item => item)
      yield if block_given?
      respond_to do |format|
        format.html { redirect_to(location) }
        format.xml  { head :ok }
      end
    else
      flash[:alert] = '非公開処理に失敗しました。'
      respond_to do |format|
        format.html { redirect_to url_for(:action => :show) }
        format.xml  { render :xml => item.errors, :status => :unprocessable_entity }
      end
    end
  end
end
