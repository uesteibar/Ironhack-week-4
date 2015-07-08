Rails.application.routes.draw do

  get '/' => "sites#home"

  resources :users, only: [:index]

end
