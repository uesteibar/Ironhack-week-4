Rails.application.routes.draw do
  get '/' => "sites#index"

  # Movies
  get "/movies/search" => "movies#search"
  resources :movies, only: [:index, :show, :create] do
    resources :comments, only: [:create]
  end

  # User login
  get "/users/login" => "users#login"
  post "/users/login" => "users#authenticate"
  delete "/users/logout" => "users#logout"
  resources :users, only: [:new, :create, :show]
end
