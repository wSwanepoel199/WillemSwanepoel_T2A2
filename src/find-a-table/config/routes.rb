Rails.application.routes.draw do
  devise_for :users
  resources :listings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "pages#home"
  root 'pages#home'
  get 'listings', to: 'listings#index'
  get 'listings/show'
  get 'listings/new', to: 'listings#new'
  get 'listings/edit', to: 'listings#edit'
  get '/tagged', to: "listings#tagged", as: :tagged

end
