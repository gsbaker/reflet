Rails.application.routes.draw do
  resources :invitations do
    member do
      patch :accept
      patch :decline
    end
  end

  resources :thought_records
  resources :need_ratings
  resources :needs_records
  resources :needs
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "users#dashboard"

  resources :users

  resources :clients

  resources :therapies do
    member do
      patch :upload_attachments
    end
  end

  resource :registration
  resource :session
  resource :password_reset
  resource :password
end
