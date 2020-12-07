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

# create an empty strains array
# loop through array of strain objects
    # bool_pos_effects = 0
    # bool_neg_effects = 0
    # bool_med_effects = 0
    # loop through selectedpositiveeffects array
        # check_pos_effects = 0
        # loop through the array of positive effects on the particular strain we are on
            # compare the effect from the selectedpositiveeffects array to the effect from the positive effects array on the strain
                # if they do match, check_pos_effects += 1
        # end loop
        # if check_pos_effects != the length of the selectedpositiveeffects array
            # then bool_pos_effects = 1
        # end
        # loop through the array of medical effects on the particular strain we are on
            # compare the effect from the selectedmedicaleffects array to the effect from the medical effects array on the strain
                # if they do match, check_med_effects += 1
        # end loop
        # if check_med_effects != the length of the selectedmedicaleffects array
            # then bool_med_effects = 1
        # end
        # loop through the array of negative effects on the particular strain we are on
            # compare the effect from the selectednegativeeffects array to the effect from the negative effects array on the strain
                # if they do match, check_neg_effects += 1
        # end loop
        # if check_neg_effects != the length of the selectednegativeeffects array
            # then bool_neg_effects = 1
        # end
        # if bool_pos_effects + bool_neg_effects + bool_med_effects = 0
            # then add the strain to strains array
        # end
    # end loop for that strain
