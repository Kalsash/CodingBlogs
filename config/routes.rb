Rails.application.routes.draw do
  get 'contacts/index'
  get 'users/index'
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'persons/profile'
  match '/users',   to: 'users#index',   via: 'get'
  root 'posts#index', as: "home"

  delete "users/:id", to: "users#destroy"

  get 'about' => 'pages#about', as: "about"
   get 'persons/profile', as: 'user_root'
  resources :posts, only: [:show, :index] do
    resources :comments
  end
  resources :contacts
  namespace :admin do

    resources :posts, except: [:show, :index]
  end
end
