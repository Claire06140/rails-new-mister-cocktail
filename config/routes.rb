Rails.application.routes.draw do

  get 'cocktails', to: "cocktails#index", as: :cocktails
  post 'cocktails', to: "cocktails#create"
  get 'cocktails/new', to: "cocktails#new", as: :new_cocktail
  get 'cocktails/:id', to: "cocktails#show", as: :cocktail
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'cocktails/:id/doses/new', to: "doses#new", as: :new_cocktail_dose
  post 'cocktails/:id/doses', to: "doses#create"
  delete 'doses/:id', to: "doses#destroy"
end
