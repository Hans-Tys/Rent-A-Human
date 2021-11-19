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
    flash[:notice] = 'Booking created!'
    redirect_to persona_path(@persona)
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to dashboard_path
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end
end
