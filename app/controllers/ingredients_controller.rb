class IngredientsController < ApplicationController

  def meal_ingredients
    @list_ingredients = Ingredient.where(meal_id: params[:meal_id])
    @meals_info = Meal.where(id: params[:meal_id])
  end

  def add
    meal_ingredients
    @ingredients = Ingredient.new
  end

  def create
    @ingredients = Ingredient.new(ingredients_params)
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