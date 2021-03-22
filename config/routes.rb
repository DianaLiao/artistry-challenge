Rails.application.routes.draw do

  resources :artists, only: [:index, :show, :new, :create]
  resources :artist_instruments, only: [:new, :create]
  resources :instruments, only: [:index, :show, :new, :create]

end
