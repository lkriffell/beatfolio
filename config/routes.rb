Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  # Samples
  get '/samples', to: 'samples#index'

  # Beats
  get '/beats/new', to: 'beats#new'
  post '/beats/new', to: 'beats#create'
  get '/beats/:id', to: 'beats#show'
  get '/beats/:id/destroy', to: 'beats#destroy'
  get '/beats/:id/update', to: 'beats#edit'
  post '/beats/:id/update', to: 'beats#update'

  # Tags
  get '/beats/:id/tags/edit', to: 'beat_tags#edit'
  post '/beats/:id/tags/edit', to: 'beat_tags#create'
  get '/tags/:id/destroy', to: 'beat_tags#destroy'

  # Users
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/users/:id/update', to: 'users#edit'
  post '/users/:id/update', to: 'users#update'

  # Likes

  get '/beats/:id/like', to: 'likes#create'
  get '/beats/:id/unlike', to: 'likes#destroy'
  get '/users/:id/likes', to: 'likes#index'

  # UserFollows
  post '/users/:id/follow', to: 'user_follows#create'
  post '/users/:id/unfollow', to: 'user_follows#destroy'
  get 'users/:id/followers', to: 'user_follows#followers'
  get 'users/:id/following', to: 'user_follows#following'
  
  # sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  # Feed
  get '/feed', to: 'feeds#show'
  get '/discover', to: 'feeds#index'

  # Search
  get '/search', to: 'search#show'
end
