class ProjectsController < ApplicationController
  before_filter :authenticated?, :except => [:index, :show]

  def index
    if authenticated?
      @projects = Project.all
    else
      @projects = Project.where(:visible => true)
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to @project
    else
      render :action => :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    render :action => :new
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to @project
    else
      render :action => :new
    end
  end
end
