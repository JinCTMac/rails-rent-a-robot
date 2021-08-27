class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def profile
    @user = User.find(params[:id])
  end
end
