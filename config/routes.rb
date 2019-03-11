Rails.application.routes.draw do
  root      "home#index"
  
  get       "/request", to: "pages#request_upload",    as: "request"
  post      "/request", to: "pages#do_request_upload", as: "do_request"
  get       "/about",   to: "pages#about",             as: "about"
  get       "/search",  to: "search#view",             as: "search"

  resources :monos
  resources :colleges
  resources :courses
end
