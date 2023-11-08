class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe_category, null: false, foreign_key: true
      t.string :title, null: false, limit: 255
      t.integer :cooking_time
      t.integer :preparation_time
      t.integer :total_time
      t.string :difficulty, null: false, default: 'Facile'
      t.string :cost, null: false, default: 'Bon marché'
      t.integer :servings, null: false, default: 1, comment: 'Number of people the recipe is for'
      t.integer :status, null: false, default: 0, comment: 'Status of the recipe (draft, published, archived)'

      t.timestamps
    end
  end
end
