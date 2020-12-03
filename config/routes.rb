Rails.application.routes.draw do
  devise_for :users
  root to: "areas#index"
  resources :users, only: :show
  resources :tweets
  
end
