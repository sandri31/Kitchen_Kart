Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :recipes
  resources :recipe_steps, only: [], param: :index do
    member do
      delete '(:id)' => 'recipe_steps#destroy', as: ''
      post '/' => 'recipe_steps#create'
    end
  end
  resources :recipe_ingredients, only: [], param: :index do
    member do
      delete '(:id)' => 'recipe_ingredients#destroy', as: ''
      post '/' => 'recipe_ingredients#create'
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
