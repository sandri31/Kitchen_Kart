class CreateIngredientCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredient_categories do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
