class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @cocktail.dose = Dose.find(params[:cocktail_id])
    # @cocktail.dose.ingredient = Ingredient.find(params[:id] = @cocktail.dose[:ingredient_id])
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)

    if @cocktail.valid?
      @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new"

  end

  def new
    @cocktail = Cocktail.new
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
