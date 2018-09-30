class Product < ApplicationRecord
    include AttachmentUploader[:picture]
    validates :name, presence:true
    validates :price, presence:true
    belongs_to :user,foreign_key: "seller_id"
    belongs_to :category
    has_many :reviews
end

