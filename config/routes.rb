Rails.application.routes.draw do

  devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)

  devise_for :users
  resources :wikis
  resources :charges, only: [:new, :create]
  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

  get 'downgrade' => 'user#downgrade'
  get 'about' => 'welcome#about'
  root to: "welcome#index"



end
