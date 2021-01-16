Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: [:show, :new, :update, :edit, :create]
  root 'items#index'
  resources :items do
    resources :comments, only: [:create, :destroy]
    collection do
    get 'search'
   end
  end
  
end
