class StrainsController < ApplicationController

    def index
        @strains = Strain.all 
        render json: @strains
    end

    def show 
        @strain = Strain.find(params[:id])

        render json: @strain, include: [:flavors, :positive_effects, :negative_effects, :medical_effects]
    end

end
