Rails.application.routes.draw do
  root to: 'pages#index'

  get  'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  resources :users, only:[:index, :create]
  resources :links, only:[:index, :create]
end
