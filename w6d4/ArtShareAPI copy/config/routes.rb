Rails.application.routes.draw do
  resources :likes
  resources :comments
  get 'home/index'
  resources :users
  resources :artworks, except: [:edit, :new]
  resources :artwork_shares, except: [:edit, :index]
  resources :likes, except: [:edit, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :users do
    resources :artworks, only: :index
  end
  resources :users do
    resources :comments, only: :index
  end
  resources :artworks do
    resources :comments, only: :index
  end

  resources :artworks do
    resources :likes, only: :index
  end

  resources :users do
    resources :likes, only: :index
  end

  resources :comments do
    resources :likes, only: :index
  end

end
