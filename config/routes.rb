Rails.application.routes.draw do
  resources :companies, only: [:index, :show, :create]
end
