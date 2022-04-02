# frozen_string_literal: true

Rails.application.routes.draw do
  get 'static/landing'
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'signin',
      sign_out: 'signout',
      password: 'password',
      registration: 'register',
      sign_up: 'signup'
    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :categories, only: [:index, :show, :destroy, :new, :create]
  resources :transactions, only: [:index, :show, :destroy, :new, :create]

  # Defines the root path route ("/")
  root "static#landing"
end
