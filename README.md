# Herbals
 This app accesses an extensive database with information about positive effects, negative effects, and medical effects of different weed strains.  It is designed so the user can search for a strain and learn more about it, or provide their preferences for the effects they'd like to experience and which negative effects they'd like to avoid.  After indicating those preferences by checking boxes, users will see all the strains that match those preferences. 
 
 ## Inspiration
 This app was inspired by the idea that users may want to indicate which positive and medical effects they are looking for before making a decision about which weed strain to buy or grow.  It empowers users to learn about strains they may buy from dispensaries.  It puts a focus on the user's needs and wishes in relationship with this plant medicine.
 
 ## Technologies 
 
 💻Ruby <br />
 💻Rails <br />
 💻Javascript <br />
 💻SQLite3 <br />
 💻Active Record <br />
 
 ## Demo Video
 
 [Herbals - Strain Suggester Intro Video](https://youtu.be/DBSvbyIl-LU)
 
 ## Setup
 
- In order to experience this app, users must clone this Github repository and open it in their code editor. 
- Install the Ruby gems by running "bundle install". 
- Create your local database by running "rails db:migrate". 
- Seed the database by running "rails db:seed". 
- After doing all of that, start up the back-end by running "rails s", and the front-end by running "lite-server", which will open the app in your browser. 

## Instructions

There a couple of ways to interface with this app.  If you'd like to search for a specific strain, or all strains that contain a specific word, then use the search function.  If you'd like to filter through all of the strains and find the positive effects and medical effects you're looking for, use the checkboxes to indicate what you're looking for, then get suggestions.  Also, indicate which negative effects you'd like to avoid by using the checkboxes to indicate what you would not like to experience. 

## Code Example

```
def create
        Joiner.destroy_all
        $strains_to_display = []
        selected_positive_effects = []
        selected_negative_effects = []
        selected_medical_effects = []
        select_effects = []  

        params.each do |key, value|
           if (key.include? "effect" && "positive")
                selected_positive_effects.push(key.split("-").first)
           elsif (key.include? "effect" && "medical")
                selected_medical_effects.push(key.split("-").first)
           elsif (key.include? "effect" && "negative")
                selected_negative_effects.push(key.split("-").first)
           end
           
           select_effects.push(Effect.find_by effect: "{\"effect\"=>\"Relaxed\", \"type\"=>\"positive\"}")
        end


       selected_strains = []
        clears_positive = Strain.all.select do |strain|
            selected_positive_effects.each do |pos_effect|
                break if strain.positive_effects.exclude? pos_effect
            end
        end

        clears_medical = clears_positive.select do |strain|
            selected_medical_effects.each do |med_effect|
                break if strain.medical_effects.exclude? med_effect
            end
        end

            clears_all_three = clears_medical.select do |strain|
                selected_negative_effects.each do |neg_effect|
                    break if strain.negative_effects.include? negeffect
                end
            end

        clears_all_three.each do |strain|
            $strains_to_display.push(strain)
        end

        strain_array = $strains_to_display.map do |strain|
            Strain.find_by name: strain.name
        end

        effect_array = Effect.all.map do |effect|
            effect.id
        end

       @joiners = strain_array.map do |strain|
            Joiner.create(
                strain_id: strain.id,
                name: strain.name,
                category: strain.race,
                flavors: strain.flavor,
                positive_effects: strain.positive_effects,
                medical_effects: strain.medical_effects,
                negative_effects: strain.negative_effects
            )
        end

        redirect_to "http://localhost:3001/suggestions.html" 
        
    end


```
    
## Status
    
We are consistently trying to improve the user's experience with this app.  We value feedback from our community.  On that note, we have some ideas for improving this app:

🦾 A way to collect feedback from the community about the app user experience <br />
🦾 A way to collect feedback from the community about whether their experiences with the weed strains align with the information we have <br />
🦾 Forums to discuss different weed strains <br />
🦾 Adding other plant medicines or fungi to the app with more information <br />

## Contact 

[Linkedin](https://www.linkedin.com/in/cassandra-whitty-0a184a1a4/) Cassandra Whitty <br />
[Linkedin](https://www.linkedin.com/in/christopher-henderson-665796201/) Christopher Henderson <br />
[Linkedin](https://www.linkedin.com/in/jordan-panasewicz-77a93158/) Jordan Panasewicz
