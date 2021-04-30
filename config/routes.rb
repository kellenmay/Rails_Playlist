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
  
  
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
end