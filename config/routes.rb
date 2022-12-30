Rails.application.routes.draw do
  devise_for :users
  root to: "furimas#index"
  resources :users do
    resources :items, only: [:new, :create]
  end
end
