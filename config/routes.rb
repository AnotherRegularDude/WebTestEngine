require 'sidekiq/web'

Rails.application.routes.draw do
  root 'single_pages#index'
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development? # TODO: Make Sidekiq UI accessible in production.

  post 'user_token' => 'user_token#create', defaults: { format: :json }
  resources :confirmations, only: [:show]

  namespace :api, defaults: { format: :json } do
    resources :users, except: [:new]
  end
end
