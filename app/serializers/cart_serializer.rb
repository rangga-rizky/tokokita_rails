class CartSerializer < ActiveModel::Serializer
  attributes :id,:seller,:qty,:product

  def seller
    object.user.slice(:id, :username,:email) 
  end

  def product
    custom_product = {}
    custom_product[:id] = object.product.id
    custom_product[:name] = object.product.name
    custom_product[:price] = object.product.price
    custom_product[:picture] = object.product.picture.id
    custom_product
  end
end
