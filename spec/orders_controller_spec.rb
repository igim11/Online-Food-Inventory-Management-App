require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
    describe "POST #create" do
      it "creates a new order" do
        post :create, params: { order: { user_id: 1, order_items_attributes: { '0' => { meal_id: 1, quantity: 2 } } } }
        expect(response).to be_successful
      end
    end
  end