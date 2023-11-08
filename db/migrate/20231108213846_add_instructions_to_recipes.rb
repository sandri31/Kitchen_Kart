class AddInstructionsToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :instructions, :text, null: false, default: '', limit: 1000
  end
end
