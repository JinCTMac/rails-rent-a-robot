class RobotsController < ApplicationController
  # before_action :find_user, only: [ :new, :create ]

  def index
    @robots = Robot.all
  end

  def new
    @robot = Robot.new
  end

  def create
    @robot = Robot.new(robot_params)

    # to specifiy the user the robot belongs to we need to set .user = to @user
    @robot.user = current_user

    if @robot.save
      # return to the user the robot belongs to
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def robot_params
    # strong params for robots
    params.require(:robot).permit(:name, :category, :description, :price_per_day, :photo)
  end
end
