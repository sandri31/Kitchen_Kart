class RemoveNotNullConstraintFromIngredientIdInRecipeIngredients < ActiveRecord::Migration[7.1]
  def change
    change_column_null :recipe_ingredients, :ingredient_id, true
  end
end
