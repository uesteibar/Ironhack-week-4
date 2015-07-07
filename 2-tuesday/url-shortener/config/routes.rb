Rails.application.routes.draw do
  get '/' => 'sites#home'

  resources :urls, only: [:index, :show, :new, :create]

  get '/most_visited_pages' => "urls#most_visited_pages"

  get '/:shortcut' => 'redirection#redirect'
end
