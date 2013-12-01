class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :authenticated?
  helper_method :start_session
  helper_method :end_session

  def raise_404
    raise ActionController::RoutingError.new('Not Found')
  end

protected
  def authenticated?
    session[:authorized]
  end

  def start_session
    session[:authorized] = true
  end

  def end_session
    session[:authorized] = false
  end
end
