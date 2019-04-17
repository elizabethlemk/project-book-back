Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :notes, only: [:index, :create, :update, :destroy]
      resources :links, only: [:index, :create, :destroy]
      resources :colors, only: [:index, :create, :update, :destroy]
      resources :blog_posts, only: [:index, :show, :create, :update, :destroy]
      resources :projects, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index, :create, :update, :destroy]
      delete '/projects/:project_id/images/:image_id', to: 'projects#destroy_image'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
