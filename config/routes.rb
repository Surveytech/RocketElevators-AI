Rails.application.routes.draw do

<<<<<<< HEAD

=======
>>>>>>> main
  resources :quotes
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  scope '/admin' do
    resources :users
  end

  get "/", to: "main#index"
  get "/index", to: "main#index"
  get "/quote", to: "main#quote"
  get "/residential", to: "main#residential"
  get "/commercial", to: "main#commercial"
  get "/new", to: "registrations#new"

end
