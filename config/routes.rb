Rails.application.routes.draw do
  root to: "nikkis#index"

  devise_for :users, controllers: {
    omniauth_callbacks: "api/omniauth_callback"
  }

  namespace :api do
    post "line/callback" => "line#callback"
  end

  resources :nikkis
end
