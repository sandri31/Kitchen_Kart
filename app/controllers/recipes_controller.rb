# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_steps = @recipe.recipe_steps
    @servings = @recipe.servings
    @cooking_time = @recipe.cooking_time
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new(recipe_steps: [RecipeStep.new], recipe_ingredients: [RecipeIngredient.new])
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes
  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy!

    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:title, :servings, :cooking_time, :recipe_category_id, :difficulty, :description,
                                     recipe_ingredients_attributes: %i[id name quantity unit ingredient_id _destroy],
                                     recipe_steps_attributes: %i[id instructions])
    end
end
