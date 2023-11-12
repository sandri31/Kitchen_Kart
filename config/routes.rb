Rails.application.routes.draw do
  root 'home#index'

  resources :recipe_steps do
    member do
      post :edit
    end
  end
  resources :recipes
  devise_for :users

  get 'up' => 'rails/health#show', as: :rails_health_check
end
