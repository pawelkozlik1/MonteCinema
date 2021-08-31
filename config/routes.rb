# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :movies, :cinema_halls, :screenings, :tickets, :reservations
end
