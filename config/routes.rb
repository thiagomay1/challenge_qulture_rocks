Rails.application.routes.draw do
  scope '/api/v1/' do
    resources :companies, only: [:index, :show, :create] do
      resources :employees, only: [:index, :create, :destroy] do
      end
    end

    resources :employees, only: [] do
      get 'peers' => 'employees#peers'
      get 'subordinates' => 'employees#subordinates'
      put 'subordinate' => 'employees#add_subordinate'
      get 'subordinates/second_tier' => 'employees#second_tier_subordinates'
    end
  end
end
