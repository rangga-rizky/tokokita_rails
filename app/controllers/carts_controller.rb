class CartsController < ApplicationController
before_action :set_cart, only: [:destroy]

    def index
        @carts = current_user.carts
        json_response(@carts)
    end

    def create
        @cart = current_user.carts.where(:product_id => params[:product_id]).first
        if @cart.nil?
            @cart = current_user.carts.create!(cart_params)
        else
            params[:qty] = params[:qty] + @cart.qty
            @cart.update(params.permit(:qty)) 
        end
        json_response(@cart,:created)
    end

    def destroy
        @cart.destroy
        json_response({message: "item successfully removed"},:ok)
    end

    private

    def cart_params
        params.permit(:user_id,:product_id,:qty)    
    end
    
    def set_cart
        if current_user != Cart.find(params[:id]).user
            raise(ExceptionHandler::InvalidToken, Message.invalid_token) 
        else
            @cart = Cart.find(params[:id])
        end
    end
end
