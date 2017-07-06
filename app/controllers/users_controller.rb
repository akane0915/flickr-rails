class UsersController < ApplicationController
  before_action :authenticate_user! do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def index
    @users = User.all
  end

  def destroy
    User.find(params.fetch(:id)).destroy
    flash[:notice] = "The user has been deleted."
    redirect_to users_path
  end
end
