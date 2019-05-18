Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup' => 'user#new'
  post '/users' => 'user#create'
  get '/categories/:id/properties' => 'categories#get_props'
  get '/products/:id/edit_form' => 'products#edit_form'
  get '/products/new_form' => 'products#new'
  get '/products/new' => 'products#new_form'
  get '/categories/:id/catalog' => 'categories#show'
  get '/categories/:id/' => 'categories#build_cat'
  get '/categories/:id/filter' => 'categories#filter'
  get '/categories/search' => 'categories#search'
  post '/categories/:id/filter' => 'categories#filter'
  #get '/products' => 'products#index'
  #get '/products/:id' => 'products#show'
#  get '/edit/:id/product' => 'products#edit'
  #get '/new/product' => 'products#new'
  resources :categories
  resources :products
end
