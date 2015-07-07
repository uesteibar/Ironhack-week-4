Rails.application.routes.draw do

  get '/' => "sites#home"

  resources :contacts, only: [:index, :show, :new, :create, :destroy]
  patch '/contacts/favorite/:id' => "contacts#favorite"
  get '/favorite-contacts' => "contacts#index_favorites"

end
