Rails.application.routes.draw do
  devise_for :users
  get 'my-account', to: 'users#show', as: 'user'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :robots do
    resources :bookings, only: [ :create ] do
      collection do
        get :confirmation
      end
    end
  end
end
