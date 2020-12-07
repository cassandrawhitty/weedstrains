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

    #    selectedstrains = []
    #    Strain.all.select do |strain|
    #     selectedpositiveeffects.each do |poseffect|
    #         if strain.positive_effects.include? poseffect
    #         selectedstrains.push(strain)
    #         end
    #     selectedmedicaleffects.each do |medeffect|
    #         if strain.medical_effects.include? medeffect
    #             selectedstrains.push(strain)
    #         end
    #     selectednegativeeffects.each do |negeffect|
    #         if strain.negative_effects.include? negeffect
    #             selectedstrains.push(strain)
    #         end
    #     end 
    #     end
    #     end
    #     end

       selectedstrains = []
       Strain.all.select do |strain|

        selectedpositiveeffects.select do |poseffect|

            selectedmedicaleffects.select do |medeffect|

                selectednegativeeffects.select do |negeffect|

            if strain.positive_effects.include? poseffect

                if strain.medical_effects.include? medeffect 

                    if strain.negative_effects.include? negeffect 

                        selectedstrains.push(strain)

                    end
                end
            end
        end 
        end
        end  
        end



        byebug

        redirect_to "http://localhost:3001"
    end

    


end
