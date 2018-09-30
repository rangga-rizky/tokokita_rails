class ProductsSerializer < ActiveModel::Serializer
  attributes :id,:picture,:name,:description,:stock,:price,:category,:seller

  def picture
    object.picture.id
  end
  
  def category
    object.category.slice(:id, :name) 
  end

  def seller
    object.user.slice(:id, :username,:email) 
  end
end
