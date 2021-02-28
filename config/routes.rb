Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'
  get '/users/:id', to: 'users#show'
  
  # sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'
end
