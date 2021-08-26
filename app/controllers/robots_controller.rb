class RobotsController < ApplicationController
  before_action :find_robot, only: [ :show, :edit, :update, :destroy ]

  def index
    # if params[:query].present? || params[:category].present?
    #   if params[:category] == "All" && params[:query].empty?
    #     @robots = Robot.all
    #   else
    #     search_input = "#{params[:query]} #{params[:category]}"
    #     @robots = Robot.search_by_name_and_category(search_input)
    #   end
    if params[:query].present?
      @robots = Robot.search_by_name_and_category(params[:query])
    else
      @robots = Robot.all
    end
  end

  def show
    @booking = Booking.new
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
      redirect_to robot_path(@robot)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @robot.update(robot_params)
      redirect_to @robot, notice: 'Robot was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @robot.destroy
    redirect_to robots_path
  end

  private

  # def find_user
  # #   @user = User.find(params[:user_id])
  #  end

  def find_robot
    @robot = Robot.find(params[:id])
  end

  def robot_params
    params.require(:robot).permit(:name, :category, :description, :price_per_day, :photo)
  end
end
