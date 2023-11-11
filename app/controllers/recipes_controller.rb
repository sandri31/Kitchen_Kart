# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    if user_signed_in?
      if current_user.admin? || current_user.moderator?
        @recipes = Recipe.all
      else
        @recipes = Recipe.published.or(Recipe.where(user: current_user, status: :private_status))
      end
    else
      @recipes = Recipe.published
    end
  end

  def show; end

  def new
    @recipe = Recipe.new(servings: 2)
  end

  def edit; end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    # Set initial status based on user's choice
    if params[:commit] == 'Save as Private'
      @recipe.status_private_status!
    elsif params[:commit] == 'Submit for Approval'
      @recipe.status_initial_draft!
    end

    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: 'Recipe was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:title, :recipe_category_id, :cooking_time, :preparation_time,
                                     :difficulty, :cost, :servings, :status, :description)
    end
end
