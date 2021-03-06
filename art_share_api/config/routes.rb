Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Prefix Verb             URI     Pattern                    Controller#Action
  # users                   GET    /users(.:format)               users#index
  #                         POST   /users(.:format)               users#create
  # new_user                GET    /users/new(.:format)           users#new
  # edit_user               GET    /users/:id/edit(.:format)      users#edit
  # user                    GET    /users/:id(.:format)           users#show
  #                         PATCH  /users/:id(.:format)           users#update
  #                         PUT    /users/:id(.:format)           users#update
  #                         DELETE /users/:id(.:format)           users#destroy
  # resources :users

  
  patch 'users/:id', to: 'users#update', as: "update_user"
  patch 'artworks/:id', to: 'artworks#update', as: "update_artwork"
  
  resources :users, only: [:create, :destroy, :index, :show, :update]
  resources :artworks, only: [:create, :destroy, :show, :update]
  resources :artwork_shares, only: [:index, :create, :destroy]
  resources :comments, only: [:index, :create, :destroy]

  # get 'users/:artist_id/artworks', to: 'artworks#index'
  resources :users do 
    resources :artworks, only: :index
    resources :likes, only: :index
    get 'favorite_artworks', on: :member
    get 'favorite_shared_artworks', on: :member
    get 'collections', on: :member
    get 'collection_names', on: :member
    get 'artworks_in_collection', on: :member
  end

  resources :artworks do
    get 'collections', on: :member
  end

end