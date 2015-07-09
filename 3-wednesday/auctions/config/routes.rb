Rails.application.routes.draw do

  get '/' => "sites#home"


  post 'users/login' => "sites#login"
  delete 'users/login' => "sites#logout"

  resources :users, only: [:index, :show, :new, :create, :destroy] do
    resources :products, only: [:index, :show, :new, :create, :destroy] do
      resources :bids, only: [:create]
    end
  end


end
