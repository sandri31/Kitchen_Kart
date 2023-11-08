# frozen_string_literal: true

# RecipeIngredient acts as a join table between Recipes and Ingredients.
# It specifies the quantity and unit of each ingredient needed for a recipe,
# enabling detailed recipe construction.
# Example: "2 carottes", "1 cuillère à soupe de sel", etc.
class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
