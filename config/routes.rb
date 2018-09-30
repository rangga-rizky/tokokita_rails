Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/auth/register' ,to: 'users#create'
  post '/auth/login', to: 'authentication#authenticate'

  get '/categories', to: 'categories#index'
  get '/profiles/me', to: 'users#me'
  put '/profiles', to: 'users#update'
  get '/products', to: 'products#index'
  post '/products', to: 'products#create'
  get '/products/:id', to: 'products#show'

  resources :carts
  resources :cards
  resources :addresses
end