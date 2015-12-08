Rails.application.routes.draw do
  get 'replies/new'

  get 'replies/show'

  get 'replies/create'

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :messages , only: [:create, :show, :new] do
    resources :replies, only: [:create,:show,:new]
  end
end
