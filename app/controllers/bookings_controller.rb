class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
  end

  def destory
    @booking = Booking.find(params[id])
    @booking.destroy
    redirect_to personas_path
  end

  private

  def params_booking
    params.require(:booking).permit(:user_id, :persona_id)
  end
end
