class IngredientsController < ApplicationController

  def add
    @ingredients = Ingredient.new
  end

  def create
    @ingredients = Ingredients.new(ingredients_params)
    if @ingredients.save
      redirect_to add_meal_path
    else
      render :new
    end
  end

  private
  def ingredients_params
    params.permit(:ingredients_name, :quantity, :unit, :meal_id)
  end

end
