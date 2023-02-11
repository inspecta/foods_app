Rails.application.routes.draw do
  resources :foods
  devise_for :users

  root "users#index"
  resources :users, only: [:index, :show] do
    resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    end
  end

  resources :public_recipes, only: [:index]
end
