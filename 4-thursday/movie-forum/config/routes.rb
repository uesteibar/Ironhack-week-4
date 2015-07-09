Rails.application.routes.draw do
  get '/' => "sites#index"

  # Movies
  get "/movies/search" => "movies#search"
  resources :movies, only: [:index, :show, :create] do
    resources :comments, only: [:create]
  end
end
