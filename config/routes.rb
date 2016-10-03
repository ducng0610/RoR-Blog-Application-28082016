# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root 'blog#index'

  resources :dashboard, only: %w(), path: '/dashboard' do
    collection do
      get '/', to: 'dashboard#index'
      get '/blogs', to: 'dashboard#blogs'
    end
  end

  resources :blog, only: %w(), path: '/blog' do
    collection do
      get '/', to: 'blog#index'
      get '/manage', to: 'blog#manage'
      get '/new', to: 'blog#new'
      get '/:id/edit', to: 'blog#edit'
      get '/:id/detail', to: 'blog#detail'
      post '/create', to: 'blog#create'
      post '/:id/update', to: 'blog#update'
      post '/:id/add_comment', to: 'blog#add_comment'
    end
  end
end
