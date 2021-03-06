Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :personas do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:destroy] do
      resources :reviews, only: [:index, :new, :create]
    end

  get "dashboard", to: "pages#dashboard", as: :dashboard

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
