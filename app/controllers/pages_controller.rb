class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    @personas = Persona.all
    @bookings = Booking.all
    @reviews = Review.all
  end
end
