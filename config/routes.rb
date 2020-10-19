Rails.application.routes.draw do

  resources :photos
      resources :announcements
      resources :reviews
      resources :events
      resources :invitations
      resources :members

      post '/login', to: 'auth#create'

   

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
