Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: { sign_up: :sign_up },
    controllers: { registrations: :registrations }

    root 'home#index'
end
