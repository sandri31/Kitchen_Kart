# frozen_string_literal: true

# RecipeCategory serves to categorize recipes into different types such as
# "Apéritif", "Entrées", "Plats", "Dessert", etc., allowing for easier organization
# and retrieval of recipes based on their category.
class RecipeCategory < ApplicationRecord
  has_many :recipes, dependent: :destroy
end
