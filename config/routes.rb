Rails.application.routes.draw do

      resources :announcements
      resources :reviews
      resources :events
      resources :invitations
      resources :members
   

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
