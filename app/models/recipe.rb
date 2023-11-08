# frozen_string_literal: true

# The Recipe model encapsulates the details of a cooking recipe. It belongs to a User
# (the creator of the recipe) and a RecipeCategory. It also has many ingredients
# through the RecipeIngredient association, and it can be commented on and rated by Users.
class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe_category
  has_many :recipe_ingredients, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :recipe_utensils
  has_many :utensils, through: :recipe_utensils
  has_many :recipe_steps, -> { order(step_number: :asc) }, dependent: :destroy

  validates :title, presence: true
  validates :cooking_time, :preparation_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :difficulty, inclusion: { in: %w[Facile Moyen Difficile] }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }

  private

    def total_time
      cooking_time + preparation_time
    end
end
