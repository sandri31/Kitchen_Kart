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
  has_many :recipe_steps, inverse_of: :recipe
  accepts_nested_attributes_for :recipe_steps, allow_destroy: true, reject_if: proc { |attributes| attributes['instructions'].blank? }

  validates :title, presence: true
  validates :cooking_time, :preparation_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :difficulty, inclusion: { in: %w[Facile Moyen Difficile] }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }

  before_save :calculate_total_time

  enum status: { initial_draft: 0, published: 1, archived: 2, private_status: 3 }, _prefix: :status

  scope :published, -> { where(status: :published) }
  scope :private_status, -> { where(status: :private_status) }

  private

    def calculate_total_time
      self.total_time = cooking_time + preparation_time if cooking_time.present? && preparation_time.present?
    end
end
