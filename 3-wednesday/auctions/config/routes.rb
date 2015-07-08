Rails.application.routes.draw do

  get '/' => "sites#home"

  resources :users, only: [:index, :show, :new, :create] do
    resources :products, only: [:index, :new, :create]
  end

end
