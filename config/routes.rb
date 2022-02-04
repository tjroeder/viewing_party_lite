# frozen_string_literal: true

Rails.application.routes.draw do
  root 'landing#index'

  get '/register', to: 'users#new'
  resources :user_parties, only: [:create]

  resources :users, only: %i[show create] do
    get '/discover', to: 'users#discover'
    resources :movies, controller: 'user_movies', only: %i[index show] do
      resources :viewing_party, controller: 'parties', only: %i[create new]
    end
  end
end
