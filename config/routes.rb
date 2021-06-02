Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admin do
    resources :genres
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index]
  end

  resources :posts, only: [:index, :new, :create, :destroy] do
    resources :post_assessments, only: [:update, :create, :destroy]
  end

  resources :comments, only: [:update, :create, :destroy] do
    resources :comment_assessments, only: [:update, :create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    collection do
      patch 'hide'
      get 'confirm'
   end
  end

  root :to => 'homes#top'
  get 'homes/about'

end