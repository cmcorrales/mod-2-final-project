Rails.application.routes.draw do
  resources :courses do

  end
  get "/courses/cancel/:id", to: "courses#cancel", as: :cancel
  get "/courses/select/:id", to: "courses#select", as: :select

  get '/static_pages/home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#login'
  get '/logout',  to: 'sessions#logout'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
