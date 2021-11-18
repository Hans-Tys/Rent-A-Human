class BookingsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(params_booking)
    @persona = Persona.find(params[:persona_id])
    @booking.user = current_user
    @booking.persona = @persona
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
    params.require(:booking).permit(:start_date, :end_date)
  end
end
