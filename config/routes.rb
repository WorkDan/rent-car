Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names:  { sign_up: :sign_up, sign_out: :logout, sign_in: :login },
    controllers: { registrations: :registrations, sessions: :sessions }

    resources :search do
      get :show, on: :collection
    end

    root 'home#index'
end
