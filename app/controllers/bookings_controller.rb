class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    @robot = Robot.find(params[:robot_id])
    @booking.robot = @robot
    if @booking.start_date && @booking.end_date
      @booking.total_price = (@booking.end_date - @booking.start_date) * @robot.price_per_day
    end

    if @booking.save
      redirect_to confirmation_robot_bookings_path(@robot)
    else
      render "robots/show"
    end
  end

  def confirmation
    @robot = Robot.find(params[:robot_id])
    @booking = @robot.bookings.last
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
