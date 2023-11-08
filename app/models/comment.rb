# frozen_string_literal: true

# Comment is for users to leave feedback on recipes. It connects a User
# with a Recipe, containing the user's text comment.
# Example: "Cette recette est délicieuse !"
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :content, presence: true
end
