Rails.application.routes.draw do
  root "users#dashboard"

  resources :passwords,
    controller: 'clearance/passwords',
    only: [:create, :new]

  resource :session,
    controller: 'clearance/sessions',
    only: [:create]

  resources :needs
  resources :ratings, path: 'rate'
  resources :users  do
    resource :password,
      controller: 'clearance/passwords',
      only: [:edit, :update]
    resources :needs, controller: 'needs', only: [:index]
  end

  get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'

  if Clearance.configuration.allow_sign_up?
    get '/sign_up' => 'clearance/users#new', as: 'sign_up'
  end
end
