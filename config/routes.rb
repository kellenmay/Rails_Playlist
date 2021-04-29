Rails.application.routes.draw do

  resources :playlist_songs
  resources :playlist_libraries
  resources :users
  resources :songs
  resources :playlists

  root 'songs#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  



end