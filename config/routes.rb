Rails.application.routes.draw do
  root "home#index"

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :admin do
    root "dashboard#index"
  end

  namespace :lawyer do
    root "dashboard#index"
    resources :questions, only: :show
    resources :questions do
      resources :answers, only: [ :new, :create, :show ]
    end
  end

  namespace :claimant do
    root "dashboard#index"
    resources :questions, except: :index
    resources :payments, only: :update
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
