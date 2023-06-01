Rails.application.routes.draw do
  resources :vendor_details
  resources :permissions
  get 'pages/home'
  get 'pages/restricted'
  get 'latest', to: 'vendor_details#latest'

  namespace :api do
    namespace :v1 do
      resources :roles, only: [:index, :create, :update, :destroy]
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
