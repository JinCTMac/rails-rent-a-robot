Rails.application.routes.draw do
  get 'robots/new'
  get 'robots/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :robots, only: [ :index, :show, :new, :create ]
end
