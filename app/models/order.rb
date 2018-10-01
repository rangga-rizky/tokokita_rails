class Order < ApplicationRecord
    validates :total_price, presence:true
    validates :status, presence:true
    has_many :order_details
    belongs_to :user,foreign_key: "user_id"
    belongs_to :seller, class_name: "User",foreign_key: "seller_id"
    belongs_to :shipping,foreign_key: "shipping_id"
end
