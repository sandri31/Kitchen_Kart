class ChangeQuantityToIntegerInRecipeIngredients < ActiveRecord::Migration[7.1]
  def change
    change_column :recipe_ingredients, :quantity, :integer
  end
end
