Rails.application.routes.draw do

  get '/' => "sites#home"

  get '/contacts/favorites' => "contacts#index_favorites"
  patch '/contacts/:id/favorite' => "contacts#favorite"
  resources :contacts, only: [:index, :show, :new, :create, :destroy, :edit, :update]

end
