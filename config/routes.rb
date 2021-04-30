Rails.application.routes.draw do

  resources :playlist_songs
  resources :playlist_libraries
  resources :users
  resources :songs

  resources :playlists do
    resources :songs, only: [:index, :new, :create]
  end

  root 'sessions#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/profile', to: 'session#current'
  
  
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'



end