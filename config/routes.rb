Rails.application.routes.draw do
  devise_for :users
  root to: "reservations#index"
  resources :reservations
    namespace :admin do
      resources :reservations, except:[:new,:create]
    end
  resources :users ,only: :show
end
