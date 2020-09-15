Rails.application.routes.draw do
  devise_for :users
  resources :index, :users, only: [:new, :create]
end
