  require_relative '../api/mealdb'
  class MealsController < ApplicationController
  before_action :authenticate_user!
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
      params.require(:meal).permit!
    end

  end
