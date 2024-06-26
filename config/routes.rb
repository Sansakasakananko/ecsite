Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    passwords: "admins/passwords",
    confirmations: "admins/confirmations"
  }
  namespace :admins do
    resources :books
  end
  resources :books

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }

  resources :line_items ,only: :create
  resources :carts, only: [:show, :destroy]
  get :mypage, to: 'mypage#index'
  resources :tags, except: :show
  resources :products, only: [:index, :show]
  resources :orders, only: [:new, :create] do
    collection do
      get :confirm
    end
    member do
      get :complete
    end
  end
  resources :contacts, only: [:new, :create] do
    collection do
        post 'confirm'
        post 'back'
        get 'done'
    end
  end




end
