require "sidekiq/web"

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  mount Sidekiq::Web => "/sidekiq"

  namespace :v1 do
    post :sign_up, controller: :registrations, action: :create
    post :sign_in, controller: :sessions, action: :create
    delete :sign_out, controller: :sessions, action: :destroy
    post :refresh_token, controller: :sessions, action: :update

    resources :trades, only: [ :index, :create, :update, :destroy ]
    resources :currencies, only: [ :index ]
    resources :platforms, only: [ :index ]
  end
end
