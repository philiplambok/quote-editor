Rails.application.routes.draw do
  resources :notes do
    member do
      resource :date_notes, only: %i[new create edit update]
    end
  end
  root 'home#index'
end
