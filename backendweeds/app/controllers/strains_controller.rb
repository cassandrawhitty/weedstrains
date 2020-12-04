class StrainsController < ApplicationController

    def index
        @strains = Strain.all 
        render json: @strains
    end

end
