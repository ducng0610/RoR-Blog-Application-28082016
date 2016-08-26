Rails.application.routes.draw do
  devise_for :users

  root 'dashboard#index'
  
  resources :dashboard, only: %w(), path: '/dashboard' do
    collection do
      get '/blogs', to: 'dashboard#blogs'
    end
  end

  resources :blog, only: %w(), path: '/blog' do
    collection do
      get '/', to: 'blog#index'
      get '/new', to: 'blog#new'
      get '/edit', to: 'blog#edit'
      get '/:id/detail', to: 'blog#detail'
      post '/create', to: 'blog#create'
      post '/update', to: 'blog#update'
      post '/destroy', to: 'blog#destroy'
    end
  end
end
