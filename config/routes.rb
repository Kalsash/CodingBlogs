Rails.application.routes.draw do
  get 'contacts/index'
  get 'users/index'
  get 'persons/profile'
  get 'about' => 'pages#about', as: "about"
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  root 'posts#index', as: "home"

   get 'persons/profile', as: 'user_root'
  resources :users, only: [:show, :index]
  resources :posts, only: [:show, :index] do
    resources :comments
  end
  resources :contacts
  namespace :admin do

    resources :posts, except: [:show, :index]
  end
end
