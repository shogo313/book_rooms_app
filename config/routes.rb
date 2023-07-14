Rails.application.routes.draw do
  
  get 'homes/top'
  get 'rooms/index'
  get 'rooms/search'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'users/top', to: 'users#top'
  get 'users/account', to: 'users#account'
  resources :users do
    get 'books/index', to:'books#index'
  end
  resources :rooms do
    resources :books, only: [:new, :create]
    post 'books/confirm', to: 'books#confirm'
    post 'books/new' , to: 'books#back'
  end
end
