Rails.application.routes.draw do
  root to: "nikkis#index"
  resources :nikkis

  namespace :api do
    post "line/callback" => "line#callback"
  end
end
