Rails.application.routes.draw do
  resources :computers
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show create update destroy]
      resources :laboratories
    end
  end

  match '*unmatched', to: 'application#no_route_found', via: :all
end
