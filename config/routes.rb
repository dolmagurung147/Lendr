Rails.application.routes.draw do
  resources :payments, only: [:new, :create, :show, :index, :delete]
  resources :debts
  resources :users
  resources :categories, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
