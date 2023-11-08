# frozen_string_literal: true

# IngredientCategory is used to categorize ingredients. Each category can have
# multiple ingredients, e.g., a "Légumes" category would include ingredients
# like "carottes", "tomates", etc.
class IngredientCategory < ApplicationRecord
  has_many :ingredients, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
