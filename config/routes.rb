Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "areas#index"
  resources :users, only: :show
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
  end
  
end
