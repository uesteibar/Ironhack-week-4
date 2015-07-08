Rails.application.routes.draw do
  get '/' => 'sites#home'

  resources :projects, only: [:index, :show] do
    resources :entries, only: [:index]
  end

end
