# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'application#home'
  devise_for :users, path: 'api/v1/users', defaults: { format: :json }, controllers: {
    sessions: 'api/v1/users/sessions',
    registrations: 'api/v1/users/registrations',
    confirmations: 'api/v1/users/confirmations',
    unlocks: 'api/v1/users/unlocks',
    invitations: 'api/v1/users/invitations',
    passwords: 'api/v1/users/passwords'
  }
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :employees
      resources :companies
      resources :our_mails
      resources :project_users
      resources :projects
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
