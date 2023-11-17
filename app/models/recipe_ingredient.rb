# frozen_string_literal: true

# RecipeIngredient acts as a join table between Recipes and Ingredients.
# It specifies the quantity and unit of each ingredient needed for a recipe,
# enabling detailed recipe construction.
# Example: "2 carottes", "1 cuillère à soupe de sel", etc.
class RecipeIngredient < ApplicationRecord
  belongs_to :recipe, optional: true

  validates :name, presence: true
  validates :quantity, numericality: { only_integer: true, allow_nil: true }
end
