Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items do
    resources :orders
    resources :comments, only: [:create,:destroy]
  end
  resources :orders, only:[:create,:index]

  resources :mypages, only:[:index]
  resources :favorites, only:[:create]
end
