Rails.application.routes.draw do

  get '/' => "sites#home"

  resources :users, only: [:index, :show] do
    resources :products, only: [:index]
  end

end
