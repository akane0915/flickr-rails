class ImagesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    user = User.find(params[:user_id])
    @images = user.images.all
  end
end
