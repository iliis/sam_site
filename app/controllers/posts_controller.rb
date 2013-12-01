class PostsController < ApplicationController
  before_filter :authenticated?, :except => [:index, :show]

  def index
    if authenticated? then
      @posts = Post.where(:project_id => nil)
    else
      @posts = Post.where(:project_id => nil, :visible => true)
    end
  end

  def show
    @post = Post.find(params[:id])

    unless @post.visible or authenticated?
      raise_404
    end
  end

  def edit
    if params[:project_id]
      @project = Project.find(params[:project_id])
    else
      @project = false
    end

    @post = Post.find(params[:id])

    render :action => :new
  end

  def update
    @post = Post.find(params[:id])
    if params[:project_id]
      @project = Project.find(params[:project_id])
      if @post.update_attributes(params[:post])
        redirect_to @project
      else
        render :action => :new
      end
    else
      @project = false
      if @post.update_attributes(params[:post])
        redirect_to @post
      else
        render :action => :new
      end
    end
  end

  def new
    if params[:project_id]
      @project = Project.find(params[:project_id])
      @post = @project.posts.build
    else
      @project = false
      @post = Post.new
    end
  end

  def create
    if params[:project_id]
      @project = Project.find(params[:project_id])
      @post = @project.posts.create(params[:post])
      redirect_to project_path(@project)
    else
      @post = Post.create(params[:post])
      redirect_to @post
    end
  end
end
