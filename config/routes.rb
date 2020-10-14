Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'posts#index'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users', to: 'users#index'

  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :notifications, only: :index
  resources   :posts,   only: %i(new create index show destroy) do
    resources :photos,  only: %i(create)
    resources :likes,   only: %i(create destroy)
    resources :comments,only: %i(create destroy)
  end
end
