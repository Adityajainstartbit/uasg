Rails.application.routes.draw do
  resources :vendor_details
  resources :permissions
  get 'pages/home'
  get 'pages/restricted'
  get 'latest', to: 'vendor_details#latest'
  post '/approve', to: 'vendor_details#approve'
  post '/disapprove', to: 'vendor_details#disapprove'
  get '/showvendor', to: 'vendor_details#showvendor'
  namespace :api do
    namespace :v1 do
      resources :roles, only: [:index, :show, :create, :update, :destroy]
    end
  end
  devise_for :users, controllers: { tokens: 'users/tokens' }
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
