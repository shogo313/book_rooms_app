Rails.application.routes.draw do
  get 'books/index'
  get 'homes/top'
  get 'rooms/index'
  get 'rooms/search'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'users/top', to: 'users#top'
  get 'users/account', to: 'users#account'
  resources :users
  resources :rooms
  resources :books
end
