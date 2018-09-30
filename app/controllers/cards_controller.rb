class CardsController < ApplicationController
    before_action :set_card, only: [:destroy,:update]
    
    def create
        @card = current_user.cards.create!(card_params)
        json_response(@card, :created)
    end
  
     def update
        @card.update(card_params)
        json_response({message: "card successfully updated"}, :ok)
     end
       
    def destroy
        @card.destroy
        json_response({message: "card successfully removed"},:ok)
    end

    private

    def card_params
        params.permit(:holder_name,:number,:expired_date)    
    end
    
    def set_card
        if current_user != Card.find(params[:id]).user
            raise(ExceptionHandler::InvalidToken, Message.invalid_token) 
        else
            @card = Card.find(params[:id])
        end
    end
end
