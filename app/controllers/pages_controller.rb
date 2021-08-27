class PagesController < ApplicationController
  def home
    @robots = Robot.all
    @garden_bots = Robot.where("category = 'Gardening'")
    @home_bots = Robot.where("category = 'Home'")
    @user = User.all.first
    @user_bots = Robot.where(user: @user)
  end
end
