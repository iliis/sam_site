class ImagesController < ApplicationController
  before_filter :authenticated?, :except => [:show]

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
    render :layout => false
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image])

    if @image.save
      redirect_to :action => :index
    else
      render :action => new
    end
  end

  def edit
    @image = Image.find(params[:id])
    render :action => :new
  end

  def update
    @image = Image.find(params[:id])

    if @image.update_attributes(params[:image])
      redirect_to :action => :index
    else
      render :action => new
    end
  end
end
