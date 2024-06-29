# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  resources :projects, only: [:index, :show, :create, :update] do
    resources :comments, only: [:create]
  end
  root "projects#index"
end
