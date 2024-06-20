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
      get :complete
    end
  end
end