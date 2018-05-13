require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development? # TODO: Make Sidekiq UI accessible in production.

  resources :confirmations, only: [:show]

  namespace :api, defaults: { format: :json } do
    resources :users, except: %i[new edit]
    resources :topics, except: %i[new edit]
    resource :sessions, only: %i[create destroy] do
      get :show, on: :collection
    end
  end
end
