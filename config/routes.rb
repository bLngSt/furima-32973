Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :user_details, only: [:index, :create]
  end

end