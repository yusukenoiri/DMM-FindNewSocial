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
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  namespace :admin do
    resources :genres
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index]
  end

  namespace :posts do
    resources :searches, only: :index, defaults: { format: :json }
  end

  resources :posts, only: [:index, :new, :create, :destroy, :show] do
    resource :post_assessments, only: [:create, :destroy]
    resource :post_negative_assessments, only: [:create, :destroy]
    resources :comments, only: [:update, :create, :destroy, :new] do
      resource :comment_assessments, only: [:create, :destroy]
      resource :comment_negative_assessments, only: [:create, :destroy]
    end
  end

  resources :users, only: [:show, :edit, :update] do
    collection do
      patch 'hide'
      get 'confirm'
    end
  end

  resources :genres, only: [:show, :index]

  resources :inquiries, only: [:new, :create]
  post 'inquiries/confirm', to: 'inquiries#confirm', as: 'confirm'
  post 'inquiries/back', to: 'inquiries#back', as: 'back'
  get 'done', to: 'inquiries#done', as: 'done'

  root :to => 'homes#top'
  get 'homes/about'
  get 'news/data'

end