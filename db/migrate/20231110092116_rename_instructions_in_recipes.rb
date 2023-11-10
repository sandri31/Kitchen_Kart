class RenameInstructionsInRecipes < ActiveRecord::Migration[7.1]
  def change
    rename_column :recipes, :instructions, :description
  end
end
