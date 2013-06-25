class AdminController < ApplicationController

  def login
    if authenticate_with_http_basic { | user, password | user == ADMIN_CREDENTIALS["username"] && password == ADMIN_CREDENTIALS["password"] }
      start_session
    else
      request_http_basic_authentication
    end
  end

  def logout
    end_session
    redirect_to :controller => "home"
  end
end
