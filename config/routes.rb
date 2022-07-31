Rails.application.routes.draw do
  devise_scope :user do
    get "users", to: "devise/sessions#new"

    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users
  resources :users
  resources :friend_requests
  resources :friendships
  resources :profiles
  resources :posts
  resources :likes
  resources :comments
end
