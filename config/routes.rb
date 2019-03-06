Rails.application.routes.draw do
  resources :payments, only: [:new, :create, :show, :destroy]
  resources :debts
  resources :users, except: :new
  resources :categories, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'signup', to: 'users#new', as: "signup"
  get 'login', to: 'sessions#new', as: "login"
  post 'sessions', to: 'sessions#create', as: 'sessions'
  delete 'sessions', to: 'sessions#destroy'

  get '/', to: 'pages#landing', as: 'landing'

end
