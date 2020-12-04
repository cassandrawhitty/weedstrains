Rails.application.routes.draw do
  resources :flavors, only: [:index]
  resources :joiners
  resources :effects, only: [:index]
  resources :strains, only: [:index, :show]
  get "filter", to: "strains#filter"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
