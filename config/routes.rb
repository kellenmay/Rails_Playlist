Rails.application.routes.draw do




  resources :users
  resources :songs

  resources :playlists

  root 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'



end