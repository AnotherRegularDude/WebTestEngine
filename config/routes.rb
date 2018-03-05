Rails.application.routes.draw do
  root 'single_pages#index'

  post 'user_token' => 'user_token#create', defaults: { format: :json }

  namespace :api, defaults: { format: :json } do
    resources :users, except: [:new]
    resources :confirmations, only: [:show]
  end
end
