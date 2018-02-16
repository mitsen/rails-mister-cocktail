class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.where(id: params[:dose][:ingredient_id]).first
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = @cocktail.id
    @dose.ingredient_id = @ingredient.try(:id)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @dose = Dose.where(id: params[:id]).first
  end

  def destroy
    @dose = Dose.where(id: params[:id]).first
    @dose.try(:delete)
    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

end
