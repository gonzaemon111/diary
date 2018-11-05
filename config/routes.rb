Rails.application.routes.draw do
  root to: "nikkis#index"
  resources :nikkis
end
