Rails.application.routes.draw do
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
    resources :songs, only: [:index, :new, :create]
  end


end