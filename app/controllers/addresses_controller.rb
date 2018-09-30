class AddressesController < ApplicationController
    before_action :set_address, only: [:destroy,:update]
    
    def create
        @address = current_user.addresses.create!(address_params)
        json_response(@address, :created)
    end
  
     def update
        @address.update(address_params)
        json_response({message: "address successfully updated"}, :ok)
     end
       
    def destroy
        @address.destroy
        json_response({message: "address successfully removed"},:ok)
    end

    private

    def address_params
        params.permit(:city,:state)    
    end
    
    def set_address
        if current_user != Address.find(params[:id]).user
            raise(ExceptionHandler::InvalidToken, Message.invalid_token) 
        else
            @address = Address.find(params[:id])
        end
    end
end
