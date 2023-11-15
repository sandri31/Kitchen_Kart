class ChangeDefaultForServingsInRecipes < ActiveRecord::Migration[7.1]
  def change
    change_column_default :recipes, :servings, from: 1, to: 2
  end
end
