# frozen_string_literal: true

# This is the model is used to describe the different steps required
# to prepare a recipe. Each RecipeStep belongs to a specific Recipe.
# Example: step 1: cut the onions, step 2: fry the onions, etc.
class RecipeStep < ApplicationRecord
  belongs_to :recipe, optional: true
  before_validation :set_step_number, on: :create

  def set_step_number
    self.step_number = recipe.recipe_steps.count + 1
  end
end
