Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names:  { sign_up: :sign_up, sign_out: :logout, sign_in: :login },
    controllers: { registrations: :registrations, sessions: :sessions }

    root 'home#index'
    resources :bookings, only: [:index, :show, :new, :create, :update]
    resources :search,   only: [:index]
end
