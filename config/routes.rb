Rails.application.routes.draw do
  root "users#profile"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :boards
  end

  resources :boards do
    resources :lists
  end
end
