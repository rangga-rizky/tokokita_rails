class OrdersSerializer < ActiveModel::Serializer
  attributes :id,:total_price,:status,:seller,:user,:amount_of_item,:shipping,:created_at,:updated_at

  def amount_of_item
    object.order_details.length
  end

  def seller
    object.seller.slice(:id, :username,:email) 
  end

  def user
    object.user.slice(:id, :username,:email) 
  end
  
end
