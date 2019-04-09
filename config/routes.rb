Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :notes, only: [:index, :create, :update, :destroy]
      resources :links, only: [:index, :create, :destroy]
      resources :blog_posts, only: [:index, :create, :destroy]
      resources :projects, only: [:show, :create, :update, :destroy]
      resources :users, only: [:create, :update, :destroy]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
