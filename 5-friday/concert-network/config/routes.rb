Rails.application.routes.draw do

  get "/" => "sites#home"

  get "/concerts/budget/search" => "concerts#search"
  get "/concerts/budget" => "concerts#budget"
  resources :concerts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
  end

end
