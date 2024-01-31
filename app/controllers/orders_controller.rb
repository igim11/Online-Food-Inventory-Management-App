class OrdersController < ApplicationController
    def index
        render 'history'
    end

    def new
        @order = Order.new
        render 'menu'
    end
end
