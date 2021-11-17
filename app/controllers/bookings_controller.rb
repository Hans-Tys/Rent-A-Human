class BookingsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user_id = current_user
    @booking.persona_id = @booking.persona
    @booking.save
    redirect_to personas_path
    authorize @booking
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
