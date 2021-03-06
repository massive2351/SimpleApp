Rails.application.routes.draw do
  devise_for :admins, skip: :all
  devise_scope :admin do
    post 'admins/guest_sign_in', to: 'admins/sessions#new_guest'
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end
  namespace :admins do
    root :to => 'shifts#index'
    resources :shifts, only: [:index,:create, :edit, :update, :show]
    resources :users, only: [:index, :edit, :update, :show]do
      collection do
        get 'search'
      end
    end
    resources :customers, only: [:new, :create, :update, :edit, :index, :show] do
      collection do
        get 'search'
      end
    end
    resources :informations, only: [:index, :edit, :update, :create, :destroy]
    resources :records, only: [:show]

  end

  devise_for :users, skip: :all
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    get 'users/sign_in' => 'users/sessions#new', as: 'new_user_session'
    post 'users/sign_in' => 'users/sessions#create', as: 'user_session'
    delete 'users/sign_out' => 'users/sessions#destroy', as: 'destroy_user_session'
    get 'users/sign_up' => 'users/registrations#new', as: 'new_user_registration'
    post 'users' => 'users/registrations#create', as: 'user_registration'
  end

  scope module: :users do
    root :to => 'homes#top'
    get '/top' => 'shifts#top'
    resources :customers, only: [:index, :show] do
      collection do
        get 'search'
      end
    end
    resources :shifts, only: [ :update, :index, :show]
    resources :records, only: [:new, :create, :update, :edit, :index, :show]
    resources :informations, only: [:index]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
