Rails.application.routes.draw do

  get '/' => "sites#home"

  resources :users, only: [:index, :show, :new, :create, :destroy] do
    resources :products, only: [:index, :show, :new, :create, :destroy]
  end

end
