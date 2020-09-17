Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/own_bookings", to: "bookings#own_bookings"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :courses, only: [:create, :new, :update, :destroy, :index, :show] do 
    resources :bookings, except: [:destroy]
  end
end
