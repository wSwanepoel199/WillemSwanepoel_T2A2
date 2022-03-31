Rails.application.routes.draw do
  devise_for :users
  # resources :listings
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'
  get 'listings', to: 'listings#index', as: 'listings'
  post 'listings', to: 'listings#create'
  get 'listings/new', to: 'listings#new', ad: 'new_listing'
  get 'listings/:id', to: 'listings#show', as: 'listing'
  put 'listings/:id', to: 'listings#update'
  patch 'listings/:id', to: 'listings#update'
  delete 'listing/:id', to: 'listing#destroy'
  get 'listings/:id/edit', to: 'listings#edit', as: 'edit_listing'
  get '/tagged', to: 'listings#tagged', as: :tagged
  get '/search', to: 'listings#search', as: :search

end
