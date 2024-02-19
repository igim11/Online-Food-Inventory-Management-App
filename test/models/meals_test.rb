require "test_helper"

class MealsTest < ActiveSupport::TestCase

  test 'invalid without meals_name' do
    meal = Meal.new(meals_name: 'adobo')
    refute meal.valid?
    assert_not_nil meal.errors[:meals_name]
  end
  
end
