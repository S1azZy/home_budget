# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  # Defines the root path route ("/")
  root "home#index"

  resources :person_wallets, except: %i[destroy show]

  namespace :documents do
    resources :expense_operations
  end
end
