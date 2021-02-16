Rails.application.routes.draw do
  devise_for :users
  #get "/articles", to: "articles#index"
  # root 'index'
  get "/", to: "main#index"
  get "/index", to: "main#index"
  get "/quote", to: "main#quote"
  get "/residential", to: "main#residential"
  get "/commercial", to: "main#commercial"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
