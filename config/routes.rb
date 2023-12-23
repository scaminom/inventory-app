Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show create update destroy]
      resources :laboratories
      resources :peripherals
      resources :computers
      resources :custodians
      resources :assets
      resources :suggestions
      resources :activities
    end
  end

  match '*unmatched', to: 'application#no_route_found', via: :all
end
