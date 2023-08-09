Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  resources :users do
    resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :operations
    end
  end
end
