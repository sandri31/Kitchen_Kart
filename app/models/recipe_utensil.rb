# frozen_string_literal: true

class RecipeUtensil < ApplicationRecord
  belongs_to :recipe
  belongs_to :utensil
end
