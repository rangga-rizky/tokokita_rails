class User < ApplicationRecord
    has_secure_password
    has_many :products,foreign_key: :seller_id
    has_many :orders,foreign_key: :user_id
    has_many :carts
    has_many :cards
    has_many :addresses
    has_many :reviews
    validates :username, presence:true,length: {minimum:3},uniqueness: true
    validates :email, presence:true,length: {minimum:3},uniqueness: true
    validates :birthdate, presence:true
    validates :password_digest,presence:true
end
