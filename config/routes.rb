Rails.application.routes.draw do
  resources :notes do
    resources :date_notes, only: %i[new create edit update destroy]
  end
  resource :todos, only: %i[new create]
  root 'home#index'
end
