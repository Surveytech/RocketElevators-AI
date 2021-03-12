Rails.application.routes.draw do

  get 'watson/update'
  resources :leads
  resources :quotes
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  authenticate :user, ->(user) { user.admin? || user.employee? } do
    mount Blazer::Engine, at: "blazer"
  end

  devise_for :users

  scope '/admin' do
    resources :users
  end

  root :to => "main#index"

  get "/", to: "main#index"
  get "/index", to: "main#index"
  get "/residential", to: "main#residential"
  get "/commercial", to: "main#commercial"
  get "/new", to: "registrations#new"

end
