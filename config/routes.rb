Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup' => 'user#new'
  post '/users' => 'user#create'
  #get '/products' => 'products#index'
  #get '/products/:id' => 'products#show'
#  get '/edit/:id/product' => 'products#edit'
  #get '/new/product' => 'products#new'
  resources :products
end
