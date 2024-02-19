require 'rails_helper'

RSpec.describe Meal, type: :model do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }

  it 'validates presence of meals name' do
    meal = user.meals.new(meals_name: '').save
    expect(meal).to eq(false)
    expect(user.meals.count).to eq(0) # Ensure no meal was saved
  end

  it 'validates presence of description' do
    meal = user.meals.new(meals_description: '').save
    expect(meal).to eq(false)
    expect(user.meals.count).to eq(0) # Ensure no meal was saved
  end

  it 'validates presence of price' do
    meal = user.meals.new(meals_price: nil).save
    expect(meal).to eq(false)
    expect(user.meals.count).to eq(0) # Ensure no meal was saved
  end

  it 'validates presence of user' do
    meal = Meal.new(meals_name: 'Test', meals_description: 'Description', meals_price: 10).save
    expect(meal).to eq(false)
    expect(Meal.count).to eq(0) # Ensure no meal was saved
  end
end
