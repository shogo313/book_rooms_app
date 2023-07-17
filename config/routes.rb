Rails.application.routes.draw do
  
  get 'homes/top'
  get 'searches/index'
  resources :searches, only: [:show]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'users/top', to: 'users#top'
  get 'users/account', to: 'users#account'

  resources :users do
    get 'rooms/index', to:'rooms#index'
    resources :rooms, only: [:show]
    get 'books/index', to:'books#index'
  end

  resources :rooms, only: [:new, :create] do
    resources :books, only: [:new, :create]
    post 'books/confirm', to: 'books#confirm'
    post 'books/new' , to: 'books#back'
  end

end
