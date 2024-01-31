class OrdersController < ApplicationController
    before_action :authenticate_user!

    def index
        render 'history'
    end

    def new
        @order = Order.new
        render 'menu'
    end
end
