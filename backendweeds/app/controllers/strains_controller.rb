class StrainsController < ApplicationController

    def index
        @strains = Strain.all
        render json: @strains
    end

    def show 
        @strain = Strain.find(params[:id])

        render json: @strain
    end

    def filter 
        p params
        render json: params
    end

end
