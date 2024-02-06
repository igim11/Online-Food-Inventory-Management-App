class OrdersController < ApplicationController
    before_action :authenticate_user!

    def index
        render 'history'
    end

    def new
        @order = Order.new
        @meals = Meal.all
        @order_item = @order.order_items.build
        render 'menu'
    end

    def create
        @order = Order.new(order_params)
      
        respond_to do |format|
          if @order.save
            format.html { redirect_to @order, notice: 'Order was successfully created.' }
            format.json { render :show, status: :created, location: @order }
          else
            format.html { redirect_to new_order_path, status: :unprocessable_entity }
            format.json { render json: @order.errors, status: :unprocessable_entity }
          end
        end
    end      

    private

    def order_params
        params.require(:order).permit(:total_bill, :user_id, order_items_attributes: [:meal_id, :order_id, :quantity])
    end      
      
end
