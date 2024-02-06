class OrdersController < ApplicationController
    before_action :authenticate_user!

    def index
        @orders = current_user.orders.order(created_at: :desc)
        render 'history'
    end

    def menu
        @order = Order.new
        @meals = Meal.all
        @order_item = @order.order_items.build
    end

    def create
        @order = Order.new(order_params)
        @meals = Meal.all

        @order.order_items = @order.order_items.to_a.reject { |item| item.quantity.zero? }
      
        respond_to do |format|
          if @order.save
            format.html { redirect_to @order, notice: 'Order was successfully created.' }
            format.json { render :show, status: :created, location: @order }
          else
            format.html { render :menu, status: :unprocessable_entity }
            format.json { render json: @order.errors, status: :unprocessable_entity }
          end
        end
    end      

    private

    def order_params
        params.require(:order).permit(:total_bill, :user_id, order_items_attributes: [:meal_id, :order_id, :quantity])
    end      
      
end
