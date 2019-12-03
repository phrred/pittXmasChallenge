Rails.application.routes.draw do
  get 'home', to: "static_pages#home"
  get 'challenges', to: 'static_pages#challenges'
  get 'completed', to: 'static_pages#completed'
  get 'stats', to: 'static_pages#stats'
  get 'verses', to: 'static_pages#verses'
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'microsoft_auth', to: 'sessions#microsoftAuth'
  get 'auth/failure' , to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get "profile", to: "profile#show"
  post "profile", to: "profile#update"
  post "create_user", to: "profile#create"

  resources :comments, only: [:create]
  resources :profile

  root to: "login#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
