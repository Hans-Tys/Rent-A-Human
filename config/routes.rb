Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :personas do
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
