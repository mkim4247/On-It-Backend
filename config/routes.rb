Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :users, only: [:index, :create, :show, :update, :destroy]
      post '/login', to: "auth#create"
      post '/new', to: "users#create"
      get '/profile', to: "users#profile"
    end
  end
end
