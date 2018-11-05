Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/auth/register' ,to: 'users#create'
  post '/auth/login', to: 'authentication#authenticate'

  get '/categories', to: 'categories#index'
  get '/profiles/me', to: 'users#me'
  put '/profiles', to: 'users#update'
  get '/products', to: 'products#index'
  post '/products', to: 'products#create'
  get '/products/:id', to: 'products#show'
  post '/orders', to: 'orders#create'
  get '/orders/user/:id', to: 'orders#indexByUser'
  get '/orders/seller/:id', to: 'orders#indexBySeller'
  get '/orders/:id', to: 'orders#show'
  put '/orders/:id/accept', to: 'orders#accept'
  put '/orders/:id/deliver', to: 'orders#deliver'
  post '/reviews', to: 'reviews#create'

  resources :carts
  resources :cards
  resources :addresses
end
