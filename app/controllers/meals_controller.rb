  require_relative '../api/mealdb'
  class MealsController < ApplicationController
  before_action :authenticate_user!

  def add_meals_fromAPI

    @meal = current_user.meals.new(add_meals_fromapi)

    if @meal.save
      create_ingredients(params[:ingredients], @meal.id)
      create_stocks(params[:stocks], current_user.id)
      redirect_to 
    else

    end
  end



    def all_meals
        @all_meals = current_user.meals
    end

    def meal_byletter
      meal_db = Mealdb.new
      @list = meal_db.mealbyletter
    end

    def find_meal
      meal_byletter
      @meal_name = params[:search]
      if @meal_name.present?
        mealdb = Mealdb.new
        @meal_list = mealdb.search_mealbyName(@meal_name)

      else
        flash[:error] = "Search field cannot be empty"
      end
    end

    def add_meal
      all_meals
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

    def create_ingredients(ingredients_params, meal_id)
      ingredients_params.each do |ingredient_params|
        next if ingredient_params[:ingredients_name].blank? || ingredient_params[:quantity].blank? || ingredient_params[:unit].blank?

        Ingredient.create(
          meal_id: meal_id,
          ingredients_name: ingredient_params[:ingredients_name],
          quantity: ingredient_params[:quantity],
          unit: ingredient_params[:unit]
        )
      end
    end

    def create_stocks(create_stocks_params, user_id)
      create_stocks_params.each do |stocks_params|
        next if stocks_params[:ingredients_name].blank? || stocks_params[:quantity].blank? || stocks_params[:unit].blank?

        Ingredient.create(
          user_id: current_user.id,
          ingredients_name: stocks_params[:ingredients_name],
          quantity: stocks_params[:quantity],
          unit: stocks_params[:unit]
        )
      end
    end

    def add_meals_fromapi
      params.require(:meal).permit!
    end

    def meal_params
      params.require(:meal).permit(:meals_name, :meals_description, :meals_price,  meals_directions: [], meals_nutritions: [] )
    end

  end
