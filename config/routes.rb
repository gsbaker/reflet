Rails.application.routes.draw do
  resources :contracts
  resources :therapists, controller: :users
  resources :individuals, controller: :users

  resources :invitations, except: %i[ edit update ] do
    member do
      patch :accept
      patch :decline
    end

    scope module: :invitations do
      resources :contracts, only: [:show] do
        member do
          patch :accept
        end
      end
    end
  end

  resources :thought_records

  resources :need_ratings

  resources :needs_records

  resources :needs, only: %i[index show]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "users#dashboard"

  resources :users

  resources :clients
  resources :resources, only: %i[index]

  resources :questionnaires, only: %i[show], param: :slug do
    member do
      post :assign
    end
  end

  resources :assignments
  resources :responses, only: %i[create update]

  resources :therapies, except: %i[ destroy ] do
    member do
      patch :mark_completed
      patch :mark_active
    end

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
