Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'users/top', to: 'users#top'
  get 'users/account', to: 'users#account'
  resources :users
end
