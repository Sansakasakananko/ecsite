Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/new'
  get 'orders/create'
  devise_for :users
  get :mypage, to: 'mypage#index'
  resources :tags, except: :show
  resources :books
  resources :products, only: [:index, :show]
  resources :orders, only: [:new, :create] do
    collection do
      get :cinfirm
      get :complete
    end
  end
  
end
