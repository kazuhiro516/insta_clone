Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' } 
  root 'static_pages#home'
  get '/users/:id', to: 'users#show', as: 'user'

  resources :posts, only: %i(new create index) do
    resources :photos, only: %i(create)
  end
end
