Rails.application.routes.draw do
  root to: "nikkis#index"
  resources :monitors, only: %i[index]

  devise_for :users, controllers: {
    omniauth_callbacks: "api/omniauth_callback"
  }

  namespace :api do
    post "line/callback" => "line#callback"
    get "tasks/finish" => "tasks#finish"
  end

  resources :nikkis
end
