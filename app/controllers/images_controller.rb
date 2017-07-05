class ImagesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @user = User.find(params[:user_id])
    @images = @user.images.all
binding.pry
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

private
  def image_params
    params.require(:image).permit(:title, :picture)
  end
end
