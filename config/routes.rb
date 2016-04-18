Rails.application.routes.draw do
  root to: 'pages#index'

  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
end
