class Card < ApplicationRecord
    validates :holder_name, presence:true
    validates :number, presence:true
    validates :expired_date, presence:true
    belongs_to :user
end
