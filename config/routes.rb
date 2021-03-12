Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  # Samples
  get '/samples', to: 'samples#index'

  # Beats
  get '/beats/new', to: 'beats#new'
  post '/beats/new', to: 'beats#create'
  get '/beats/:id', to: 'beats#show'

  # Users
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/users/:id/update', to: 'users#edit'
  post '/users/:id/update', to: 'users#update'

  # UserFollows
  post '/users/:id/follow', to: 'user_follows#create'
  post '/users/:id/unfollow', to: 'user_follows#destroy'
  
  # sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  # Feed
  get '/feed', to: 'feeds#show'
  get '/discover', to: 'feeds#index'

  # Search
  post '/search', to: 'search#show'
end
