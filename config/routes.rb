Rails.application.routes.draw do
  get 'home/index'
  get 'attendances/new', as: 'attendances'

  resources :members 

  resources :cetyas

  resources :events 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
