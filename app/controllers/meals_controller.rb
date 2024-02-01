require_relative '../api/mealdb'
class MealsController < ApplicationController
before_action :authenticate_user!

  def find_meal
    @meal_name = params[:search]
    if @meal_name.present?
      mealdb = Mealdb.new
      @meal_list = mealdb.search_mealbyName(@meal_name)
      render json: @meal_list
    else
      flash[:error] = "Search field cannot be empty"
    end
  end

  def new
    @meal = Meal.new
  end

  def meals_category

  end

  def create
    @meal = current_user.meals.new(meal_params)
    if @meal.save
      redirect_to '/'
    else
      render :new
    end
  end

  private

  def meal_params
    params.permit(:meals_name, :meals_description, :meals_directions, :meals_nutritions, :meals_price)
  end

end
