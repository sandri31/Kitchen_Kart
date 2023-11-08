# frozen_string_literal: true

# The Ingredient model represents individual ingredients which can be used in recipes.
# Ingredients belong to an IngredientCategory, which helps in classifying them into
# groups like "Légumes", "Fruits", "Épices", etc.
# Example: "Carotte", "Tomate", "Sel", etc.
class Ingredient < ApplicationRecord
  belongs_to :ingredient_category
  has_many :recipe_ingredients, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :ingredient_category_id }
end
