Rails.application.routes.draw do
  resources :courses do

  end

  get "/courses/cancel/:id", to: "courses#cancel", as: :cancel
  get "/courses/select/:id", to: "courses#select", as: :select
  get "/", to: "users#show", as: :index
  get '/static_pages/home', to: "static_pages#home", as: :home
  get    '/signup',  to: 'users#new', as: :signup
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#login'
  get '/logout',  to: 'sessions#logout'

  resources :users do

  end

  #resources :questions

  get "/courses/:course_id/questions", to: "questions#index", as:"course_questions"
  get "/courses/:course_id/questions/new", to: "questions#new", as: "new_course_question"
  get "/courses/:course_id/questions/:question_id", to: "questions#show", as: "course_question"

  post "/courses/:course_id/questions", to: "questions#create"

  post "/questions/:question_id/", to: "comments#create", as: "question_comments"
  # get "/questions/:course_id/:question_id", "questions#show", as:"question"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
