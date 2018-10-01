class OrderSerializer < ActiveModel::Serializer
  attributes :id,:total_price,:status,:seller,:user,:order_details,:shipping,:created_at,:updated_at

  def seller
    object.seller.slice(:id, :username,:email) 
  end

  def user
    object.user.slice(:id, :username,:email) 
  end
  
  def order_details
    customized_order_details = []

    object.order_details.each do |order_details|
      custom_order_details = {}
      custom_order_details[:product] = order_details.product.slice(:id,:name,:picture,:description) 
      custom_order_details[:qty] = order_details.qty
      custom_order_details[:price] = order_details.price
      customized_order_details.push(custom_order_details)
    end
    customized_order_details
  end

end
