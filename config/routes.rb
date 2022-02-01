# frozen_string_literal: true

Rails.application.routes.draw do
  root 'landing#index'

  get '/register', to: 'users#new'

  resources :users, only: [:show, :new, :create] do
    get '/discover', to: 'users#discover'
    resources :movies, only: [:index, :show] do
      resources :viewing_party, controller: 'parties', only: [:create, :new]
    end
  end

end
