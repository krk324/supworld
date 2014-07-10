Rails.application.routes.draw do
  devise_for :users
  resources :cities, only: [:show, :create] do
    resources :memos, only: [:new, :create, :destroy]
    resources :visits, only:[:create, :destroy]
  end
  root 'home#show'
end
