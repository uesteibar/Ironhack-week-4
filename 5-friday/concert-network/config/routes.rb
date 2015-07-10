Rails.application.routes.draw do

  get "/" => "sites#home"

  resources :concerts, only: [:index, :show, :new, :create]

end
