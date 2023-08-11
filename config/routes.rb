Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  resources :users do
    resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :operations, only: [:new, :create, :show, :create, :edit, :update, :destroy]
    end
  end
end
