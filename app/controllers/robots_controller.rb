class RobotsController < ApplicationController

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

  def show
    @robot = Robot.find(params[:id])
    @booking = Booking.new
  end

  private

  def robot_params
    params.require(:robot).permit(:name, :category, :description, :price_per_day, :photo)
  end
end
