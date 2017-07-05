class ImagesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @user = User.find(params[:user_id])
    @images = @user.images.all
  end

  def new
    @user = User.find(params[:user_id])
    @image = Image.new
  end

  def create
    @user = User.find(params[:user_id])
    @image = @user.images.new(image_params)
    if @image.save
      redirect_to user_images_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @image = Image.find(params[:id])
  end

  def destroy
    user = User.find(params[:user_id])
    Image.find(params[:id]).destroy
    redirect_to user_images_path(user)
  end

  def edit
    @user = User.find(params[:user_id])
    @image = Image.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "The image has been updated."
      redirect_to user_images_path(@user)
    else
      render :edit
    end
  end

private
  def image_params
    params.require(:image).permit(:title, :picture)
  end
end
