Rails.application.routes.draw do
  root       "home#index"

  get        "/about",      to: "pages#about", as: "about"
  get        "/search",     to: "search#view", as: "search"

  resources  :monos,        path: "tccs"
  resources  :colleges
  resources  :courses
  resources  :requisitions, path: "requests"

  devise_for :users
end
