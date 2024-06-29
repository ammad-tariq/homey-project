Rails.application.routes.draw do
  devise_for :users
  
  authenticated :user do
    root 'projects#index', as: :authenticated_root
  end
  
  unauthenticated do
    devise_scope :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :projects, only: [:index, :show, :new, :create, :update] do
    resources :comments, only: [:create]
  end
end
