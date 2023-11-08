# frozen_string_literal: true

# ShoppingBag is a personalized collection of ingredients from various recipes
# that a User is interested in making. It allows users to keep track of
# all ingredients needed for their chosen recipes in one place.
class ShoppingBag < ApplicationRecord
  belongs_to :user
  has_many :shopping_bag_items, dependent: :destroy
end
