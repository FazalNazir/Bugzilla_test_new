# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :projects
  resources :bugs
  root to: 'projects#index'
end
