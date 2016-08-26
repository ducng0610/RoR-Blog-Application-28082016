Rails.application.routes.draw do
  devise_for :users

  root 'dashboard#index'
  
  resources :blog, only: %w(), path: '/blog' do
    collection do
      get '/', to: 'blog#index'
      get '/new', to: 'blog#new'
      get '/edit', to: 'blog#edit'
      post '/create', to: 'blog#create'
      post '/update', to: 'blog#update'
      post '/destroy', to: 'blog#destroy'
    end
  end

  resources :admin, only: %w(), path: '/admin' do
    collection do
      # get '/', to: 'transaction_api#handle_transaction'
    end
  end
end
