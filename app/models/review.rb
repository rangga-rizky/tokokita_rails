class Review < ApplicationRecord
    validates :rating, presence:true ,numericality: { less_than_or_equal_to: 5,  only_integer: true }
    belongs_to :user
    belongs_to :product
end
