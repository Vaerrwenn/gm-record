Rails.application.routes.draw do
  get 'home/index'

  resources :members 

  resources :cetyas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
