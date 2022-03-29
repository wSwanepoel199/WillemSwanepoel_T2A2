Rails.application.routes.draw do
  devise_for :users
  resources :listings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "pages#home"
  root 'listings#index'
  get 'listings/new', to: 'listings#new'
  get '/listings/:id/edit', to: 'listings#edit'
  # get "/listing", to: "listings#index"

  # add this line to link tags to posts with the respective tag
  get 'tags/:tag', to: 'listings#index', as: :tag

end
