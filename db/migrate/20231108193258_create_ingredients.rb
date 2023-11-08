class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false, limit: 255
      t.references :ingredient_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
