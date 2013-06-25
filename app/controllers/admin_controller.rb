class AdminController < ApplicationController
  http_basic_authenticate_with :name => "user", :password => "password"

  def login
    start_session
  end

  def logout
    end_session
    redirect_to :controller => "home"
  end
end
