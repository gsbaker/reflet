Rails.application.routes.draw do
  resources :therapists, controller: :users
  resources :individuals, controller: :users

  resources :invitations do
    member do
      patch :accept
      patch :decline
    end
  end

  resources :thought_records do
    member do
      patch :unshare
    end
  end

  resources :need_ratings

  resources :needs_records do
    member do
      patch :unshare
    end
  end

  resources :needs
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "users#dashboard"

  resources :users

  resources :clients
  resources :resources, only: %i[index update]

  resources :questionnaires, only: %i[show], param: :slug do
    member do
      post :assign
    end
  end

  resources :assignments
  resources :responses, only: %i[create update]

  resources :therapies do
    scope module: :therapies do
      resources :needs_records, only: [:show]
      resources :notes
      resources :assignments
      resources :attachments, only: [:index, :create]
      resources :needs_records, only: [:index, :show]
      resources :thought_records, only: [:index, :show]
    end
  end

  resource :registration
  resource :session
  resource :password_reset
  resource :password
end
