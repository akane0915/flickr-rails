class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
    User.find(params.fetch(:id)).destroy
    flash[:notice] = "The user has been deleted."
    redirect_to users_path
  end
end
