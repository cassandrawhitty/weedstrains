require 'json'
require 'rest-client'
require 'pry'

# Effect.destroy_all
# Strain.destroy_all
# Joiner.destroy_all

 strainsURL = 'http://strainapi.evanbusse.com/4nX8ujH/strains/search/all'
response = RestClient.get(strainsURL)
    allStrains = JSON.parse(response)
    # binding.pry
    # allStrains

    effectsURL = 'http://strainapi.evanbusse.com/4nX8ujH/searchdata/effects'
    response = RestClient.get(effectsURL)
        allEffects = JSON.parse(response)
        binding.pry
       