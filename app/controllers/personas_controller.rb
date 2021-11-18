class PersonasController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_persona, only: [:show, :edit, :destroy]

  def index
    # @personas = Persona.all
    @personas = policy_scope(Persona).order(created_at: :desc)
    @markers = @personas.geocoded.map do |persona|
      {
        lat: persona.latitude,
        lng: persona.longitude
      }
    end
  end

  def show
    @booking = Booking.new
    @bookings = Booking.all
  end

  def new
    @persona = Persona.new
    authorize @persona
  end

  def create
    @persona = Persona.new(persona_params)
    @persona.user = current_user
    authorize @persona
    if @persona.save
      redirect_to personas_path(@persona)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @persona.update(persona_params)
    authorize @persona
  end

  def destroy
    @persona.destroy
    redirect_to personas_path
  end

  private

  def set_persona
    @persona = Persona.find(params[:id])
    authorize @persona
  end

  def persona_params
    params.require(:persona).permit(:name, :description, :location, :activity, photos: [])
  end
end
