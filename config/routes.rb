Rails.application.routes.draw do
  resources :notes do
    resources :date_notes, only: %i[new create edit update destroy]
  end
  root 'home#index'
end
