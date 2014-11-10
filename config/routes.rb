Rails.application.routes.draw do
  root 'gists#index'
  devise_for :users
  resources :gists do
    resources :comments, only: [:create]
  end
end
