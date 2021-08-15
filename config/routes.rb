Rails.application.routes.draw do
  resources :companies, only: [:index, :show, :create] do
    resources :employees, only: [:index, :destroy] do
    end
  end

  put 'leader/:leader_id/subordinate', to: 'employees#leader'
end
