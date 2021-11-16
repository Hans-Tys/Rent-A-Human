class PersonasController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_persona, only: [:show, :edit, :destroy]

  def index
    @personas = Persona.all
  end

  def show
  end

  def new
    @persona = Persona.new
  end

  def create
    @persona = persona.new(persona_params)
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
  end

  def destroy
    @persona.destroy
    redirect_to personas_path
  end

  private

  def set_persona
    @persona = Persona.find(params[:id])
  end

  def persona_params
    params.require(:persona).permit(:name, :description, :location, :activity, :photo)
  end
end
