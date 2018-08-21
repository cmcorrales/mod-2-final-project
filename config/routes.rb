Rails.application.routes.draw do
  resources :courses do
    get "cancel/:id", to: "courses#cancel", as:"cancel_course"
    get "select/:id", to: "courses#select", as:"select_course"
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
