class JoinersController < ApplicationController

    def index
        # byebug
        @joiners = Joiner.all 
        render json: @joiners 
    end

    def create
        # byebug
        # Joiner.create(
            
        # )
selectedpositiveeffects = []
selectednegativeeffects = []
selectedmedicaleffects = []
selecteffects = []  
        params.each do |key, value|
           if (key.include? "effect" && "positive")
                # effects = Effect.find_by effect: key.split("-").first
                selectedpositiveeffects.push(key.split("-").first)
           elsif (key.include? "effect" && "medical")
            selectedmedicaleffects.push(key.split("-").first)
           elsif (key.include? "effect" && "negative")
            selectednegativeeffects.push(key.split("-").first)
           end
           
           selecteffects.push(Effect.find_by effect: "{\"effect\"=>\"Relaxed\", \"type\"=>\"positive\"}")
        #    puts selecteffects
        end

       selectedstrains = Strain.all.select do |strain|
            
            byebug
        end



        # byebug

        redirect_to "http://localhost:3001"
    end

    


end
