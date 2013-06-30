class PostsController < ApplicationController
  before_filter :authenticated?, :except => [:index, :show]

  def edit
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:id])

    render :action => :new
  end

  def update
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to project_path(@project)
    else
      render :action => :new
    end
  end

  def new
    @project = Project.find(params[:project_id])
    @post = @project.posts.build
  end

  def create
    @project = Project.find(params[:project_id])
    @post = @project.posts.create(params[:post])
    redirect_to project_path(@project)
  end
end
