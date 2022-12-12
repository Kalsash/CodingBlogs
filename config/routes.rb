Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'persons/profile'
  root 'posts#index', as: "home"
  get 'about' => 'pages#about', as: "about"
   get 'persons/profile', as: 'user_root'
  resources :posts do
    resources :comments
  end
end
