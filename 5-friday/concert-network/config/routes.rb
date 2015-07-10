Rails.application.routes.draw do

  get "/" => "sites#home"

  resources :concerts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
  end

end
