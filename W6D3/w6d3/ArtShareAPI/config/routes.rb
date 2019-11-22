Rails.application.routes.draw do
  get 'artworks/except:'
  get 'artworks/[edit,'
  get 'artworks/new]'
  get 'home/index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
