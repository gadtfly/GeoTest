TylerTest::Application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :statuses
  resources :locations, only: [:index, :show]

  root to: 'statuses#index'
end
