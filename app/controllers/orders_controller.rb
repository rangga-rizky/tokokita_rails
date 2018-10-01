class OrdersController < ApplicationController

    def indexByUser
        @orders = current_user.orders
        render json: @orders , each_serializer: OrdersSerializer  
    end

    def indexBySeller
        @orders = Order.where(:seller_id => current_user.id)
        render json: @orders , each_serializer: OrdersSerializer  
    end

    def show
        @order = Order.find(params[:id])
        if @order.user_id != current_user.id && @order.seller_id != current_user.id
            raise(ExceptionHandler::InvalidToken, Message.invalid_token) 
        end
        json_response(@order)
    end


    def create
        carts = current_user.carts
        orders = {}        
        carts.each do |x| 
            if orders[x.product.seller_id] == nil
                orders[x.product.seller_id] = {:products => [],:total_price => x.product.price}
                orders[x.product.seller_id][:products] << x
            else
                orders[x.product.seller_id][:products] << x
                orders[x.product.seller_id][:total_price] += x.product.price
            end
        end

        orders.each do |seller_id,items|
            order = current_user.orders.create!({
                :seller_id => seller_id,
                :shipping_id => params[:shipping_id],
                :total_price => items[:total_price]
            })
            items[:products].each do |cart|
                order.order_details.create!(
                    :product_id => cart.product_id,
                    :price => cart.product.price,
                    :qty => cart.qty
                )
            end
        end
        current_user.carts.destroy_all
        json_response({message: "Order berhasil dibuat"})
    end
end
