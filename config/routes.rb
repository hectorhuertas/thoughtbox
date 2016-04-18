Rails.application.routes.draw do
  root to: 'pages#index'

  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'

  resources :users, only:[:index, :create]
  resources :links, only:[:index]
end
