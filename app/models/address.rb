class Address < ApplicationRecord
    validates :city,presence:true
    validates :state,presence:true
    belongs_to :user
end
