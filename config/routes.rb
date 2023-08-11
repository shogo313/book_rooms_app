Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#top'

  devise_for :user, skip: :all
  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create' , as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
    get 'signup_cancel', to: 'devise/registrations#cancel', as: :cancel_user_registration
    get 'signup', to: 'devise/registrations#new', as: :new_user_registration
    get 'user/account/edit', to: 'devise/registrations#edit', as: :edit_user_session
    put 'user', to: 'devise/registrations#update', as: :update_user_registration
    delete 'user', to: 'devise/registrations#destroy', as: :destroy_user_registration
    post 'user', to: 'devise/registrations#create', as: :create_user_registration
  end
  
  resource :user,only: [:show, :edit, :update] do
    get :account, on: :collection
    resources :rooms, only: [:index, :show]
    resources :books, only: [:index]
  end

  resources :rooms, only: [:new, :create] do
    resources :books, only: [:new, :create]
    post 'books/confirm', to: 'books#confirm'
    post 'books/new' , to: 'books#back'
  end

  resources :searches, only: [:index, :show]
end
