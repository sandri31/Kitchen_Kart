Rails.application.routes.draw do
  root 'home#index'

  resources :recipe_steps do
    member do
      post :edit
    end
  end

  resources :recipes, path: 'recettes', path_names: { new: 'nouvelle_recette', edit: 'modifier_recette' }
  devise_for :users

  get 'up' => 'rails/health#show', as: :rails_health_check
end
