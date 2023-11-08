class CreateRecipeSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_steps do |t|
      t.references :recipe, null: false, foreign_key: true
      t.integer :step_number, null: false
      t.text :instructions, null: false

      t.timestamps
    end
  end
end
