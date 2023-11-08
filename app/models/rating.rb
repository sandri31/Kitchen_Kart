# frozen_string_literal: true

# Rating allows users to score a recipe on a scale (e.g., 1 to 5).
# It links a User with a Recipe and includes the score given by the user.
class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
