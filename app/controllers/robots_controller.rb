class RobotsController < ApplicationController
  # before_action :find_user, only: [ :new, :create ]

  def new
    # need to find the user the robot belongs to
    # via the url params :user_id
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

  def show
    # @robot = Robot.new
    @robot = Robot.find(params[:id])
  end


  private

  # def find_user
  # #   @user = User.find(params[:user_id])
  #  end

  # def find_robot
  #   @robot = Robot.find(params[:robot_id])
  # end

  def robot_params
    # strong params for robots
    params.require(:robot).permit(:name, :category, :description, :price_per_day)
  end
end
