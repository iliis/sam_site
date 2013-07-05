class HomeController < ApplicationController
  def index
    if authenticated?
      @posts = Post.order("created_at DESC")
    else
      @posts = Post.where(:visible => true).order("created_at DESC")
    end
  end
end
