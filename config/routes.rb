Rails.application.routes.draw do
  get 'playlist_user/new'
  get 'playlist_user/create'
  get 'playlist_user/edit'
  get 'playlist_user/update'
  get 'playlist_user/destroy'
  get '/top_song', to: 'songs#top_song'
  root 'sessions#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/profile', to: 'users#profile'
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'


  resources :users
  resources :songs

  resources :playlists do
    resources :playlist_songs, only: [:index, :new, :create]
    resources :playlist_users, only: [:new, :create, :edit, :update, :destory]
  end


end