class ProductsController < ApplicationController
    before_action :set_product, only: [:show]
    skip_before_action :authorize_request, only: [:index,:show]

    def index
        @products = Product.paginate(page: params[:page], per_page: 2)
        pagination_response(@products,ProductsSerializer)
    end

    def show
        json_response(@product)
    end

    def create
        @product = current_user.products.create!(product_params)
        json_response(@product, :created)
      end

    private
    
    def product_params
        params.permit(:name,:description,:stock,:price,:category_id,:picture)
    end

    def set_product
        @product = Product.find(params[:id])
    end
end
