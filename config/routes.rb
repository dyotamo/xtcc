Rails.application.routes.draw do
  devise_for :users
  root      "home#index"
  
  get       "/about",  to: "pages#about", as: "about"
  get       "/search", to: "search#view", as: "search"

  resources :monos
  resources :colleges
  resources :courses
  resources :requisitions
end
