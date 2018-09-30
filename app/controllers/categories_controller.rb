class CategoriesController < ApplicationController
    skip_before_action :authorize_request, only: [:index]
    
    def index
        @categories = Category.where(:parent => nil)
        json_response(@categories)
    end
end
