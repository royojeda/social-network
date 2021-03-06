Rails.application.routes.draw do
  resources :posts
  devise_scope :user do
    get "users", to: "devise/sessions#new"

    authenticated :user do
      root 'users#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users
  resources :users
  resources :friend_requests
  resources :friendships
end
