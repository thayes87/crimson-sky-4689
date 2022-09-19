Rails.application.routes.draw do
  resources :dishes, only: [:show]
  resources :chefs, only: [:show]
  resources :chefs, module: :chef do
    resources :ingredients, only: [:index]
  end
end