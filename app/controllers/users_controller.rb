class UsersController < ApplicationController
  before_filter :authenticate_user!
  ADMIN = [1, 3]

  def index
    @users = User.all
    unless ADMIN.include?(current_user.id)
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def show
    @user = User.find(params[:id])
    unless ADMIN.include?(current_user.id)
      redirect_to root_path, :alert => "Access denied."
    end
  end
end
