# frozen_string_literal: true

class RecipeIngredientsController < ApplicationController
  before_action :setup_recipe

  def new; end

  def destroy; end

  private

  def setup_recipe
    @recipe = Recipe.new(recipe_ingredients: [RecipeIngredient.new])
  end
end
