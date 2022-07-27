# frozen_string_literal:true

Rails.application.routes.draw do

  resources :apply_jobs , only: [:create, :destroy]
  resources :jobs
  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/contact'
  get 'static_pages/about'
  devise_for :users ,controllers: {
    sessions: 'devise/sessions'
    # registrations: 'devise/registrations'
   
  }
  resources :user_profiles ,only:[:show]
  resources :users
end
