Rails.application.routes.draw do
  resources :users, except: [:update, :create, :show]
  resources :items
  resources :cart,except: %i[:destroy]
  root :to => 'index#index'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show'
  put '/edit-profile', to: 'users#update'
  post '/auth/login', to: 'authentication#authenticate'
  delete '/cart', to: 'cart#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
