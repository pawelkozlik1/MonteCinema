# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :movies, :cinema_halls, :screenings, :reservations
  resources :tickets, only: %i[index show update delete] do
    collection do
      post '/online', to: 'tickets#create'
      post '/offline', to: 'tickets#create_offline'
    end
  end
end
