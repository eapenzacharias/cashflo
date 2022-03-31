# frozen_string_literal: true

Rails.application.routes.draw do
  get 'invoices/index'
  get 'invoices/new'
  get 'invoices/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :categories, only: [:index, :show, :destroy, :new, :create]
  resources :transactions, only: [:show, :destroy, :new, :create]

  # Defines the root path route ("/")
  root "categories#index"
end
