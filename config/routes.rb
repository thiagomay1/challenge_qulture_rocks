Rails.application.routes.draw do
  resources :companies, only: [:index, :show, :create] do
    resources :employees, only: [:index, :destroy] do
    end
  end

  resources :employees, only: [] do
    get 'peers' => 'employees#peers'
    put 'subordinate' => 'employees#add_subordinate'
  end
end
