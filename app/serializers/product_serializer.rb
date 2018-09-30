class ProductSerializer < ActiveModel::Serializer
  attributes :id,:picture,:name,:description,:stock,:price,:category,:seller,:reviews

  def category
    object.category.slice(:id, :name) 
  end

  def picture
    object.picture.id
  end

  def seller
    object.user.slice(:id, :username,:email) 
  end

  def reviews
    customized_reviews = []

    object.reviews.each do |review|
      custom_review = review.attributes
      custom_review[:user] = review.user.slice(:id, :username) 
      custom_review[:review] = review.review
      custom_review[:rating] = review.rating
      custom_review[:created_at] = review.created_at
      customized_reviews.push(custom_review)
    end
    customized_reviews
  end
end
