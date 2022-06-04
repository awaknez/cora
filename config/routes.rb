Rails.application.routes.draw do
  devise_for :users
  root to: "reservations#index"
  resources :reservations do
    collection do
      post :confirm
      get 'reservations/:id', to:'reservations#confirm'
    end
  end
    namespace :admin do
      resources :reservations, except:[:new,:create]
    end

  resources :users ,only: :show
end
