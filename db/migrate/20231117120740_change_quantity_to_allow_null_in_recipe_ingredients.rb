class ChangeQuantityToAllowNullInRecipeIngredients < ActiveRecord::Migration[7.1]
  def change
    change_column_null :recipe_ingredients, :quantity, true
  end
end
