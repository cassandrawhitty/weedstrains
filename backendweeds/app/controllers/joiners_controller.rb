class JoinersController < ApplicationController

    def index
        # byebug
        @joiners = Joiner.all 
        render json: @joiners 
    end

    def create
        # byebug
        Joiner.create(
            
        )
        redirect_to "http://localhost:3001"
    end



end
