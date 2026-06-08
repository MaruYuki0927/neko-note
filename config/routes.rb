Rails.application.routes.draw do
  devise_for :users
  root "homes#top"

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:show] do
    resource :relationships, only: [:create, :destroy]
    
    member do
      get :followings
      get :followers

      get :edit
      patch :update
    end
  end

  resources :cats, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get 'top' => 'homes#top'
end
