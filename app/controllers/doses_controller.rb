class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]
  def index
    @doses = Dose.all
  end

  def show
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(doses_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save!
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    #@cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
