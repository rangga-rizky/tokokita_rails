class Category < ApplicationRecord    
    has_many :childs, class_name: "Category",foreign_key: "parent"
    belongs_to :parent, class_name: "Category"
end
