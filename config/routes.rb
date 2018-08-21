Rails.application.routes.draw do
  resources :courses do
    get "cancel/:id", to: "courses#cancel", as:"cancel_course"
    get "select/:id", to: "courses#select", as:"select_course"
  end

  get '/static_pages/home'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#login'
  get '/logout',  to: 'sessions#logout'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
