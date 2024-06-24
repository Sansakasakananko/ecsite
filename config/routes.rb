Rails.application.routes.draw do
  resources :line_items ,only: :create
  resources :carts, only: [:show, :destroy]
  devise_for :users
  get :mypage, to: 'mypage#index'
  resources :tags, except: :show
  resources :books
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