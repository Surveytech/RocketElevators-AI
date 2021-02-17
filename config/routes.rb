Rails.application.routes.draw do
<<<<<<< HEAD
  resources :soumissions
=======
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
>>>>>>> main
  devise_for :users
<<<<<<< HEAD
  #get "/articles", to: "articles#index"
  # root 'index'
=======

>>>>>>> 3871e81f3446e46f07e59448c20866e9ba304601
  get "/", to: "main#index"
  get "/index", to: "main#index"
  get "/quote", to: "main#quote"
  get "/residential", to: "main#residential"
  get "/commercial", to: "main#commercial"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
