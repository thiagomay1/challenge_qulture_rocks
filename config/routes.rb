Rails.application.routes.draw do
  resources :companies, only: [:index, :show, :create] do
    resources :employees, only: [:index, :destroy] do
    end
  end

  resources :employees, only: [] do
    get 'peers' => 'employees#peers'
    get 'subordinates' => 'employees#subordinates'
    put 'subordinate' => 'employees#add_subordinate'
    get 'subordinates/second_tier' => 'employees#second_tier_subordinates'
  end
end
