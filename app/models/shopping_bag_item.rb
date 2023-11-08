# frozen_string_literal: true

# ShoppingBagItem represents a single ingredient within a ShoppingBag.
# It details the quantity of a specific ingredient that a user wishes
# to have or purchase.
class ShoppingBagItem < ApplicationRecord
  belongs_to :shopping_bag
  belongs_to :ingredient

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
