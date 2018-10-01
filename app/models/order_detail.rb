class OrderDetail < ApplicationRecord
    validates :price, presence:true
    validates :qty, presence:true
    belongs_to :order
    belongs_to :product
end
