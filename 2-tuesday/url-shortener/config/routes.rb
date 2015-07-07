Rails.application.routes.draw do
  get '/' => 'sites#home'

  resources :urls, only: [:index, :show, :new, :create]
end
