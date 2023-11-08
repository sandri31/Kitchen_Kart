class ShoppingBagItem < ApplicationRecord
  belongs_to :shopping_bag
  belongs_to :ingredient
end
