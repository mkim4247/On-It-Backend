Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :update, :destroy]
      resources :user_boards, only: [:create, :update, :destroy]
      resources :user_projects, only: [:create, :update, :destroy]
      resources :user_todos, only: [:create, :update, :destroy]
      resources :teams, only: [:index, :create, :show, :update, :destroy]
      resources :team_boards, only: [:create, :update, :destroy]
      resources :team_projects, only: [:create, :update, :destroy]
      resources :team_todos, only: [:create, :update, :destroy]
      resources :invites, only: [:index, :create, :destroy]
      resources :user_teams, only: [:index, :create, :destroy]
      post '/login', to: "auth#create"
      post '/new', to: "users#create"
      get '/profile', to: "users#profile"
    end
  end
end
