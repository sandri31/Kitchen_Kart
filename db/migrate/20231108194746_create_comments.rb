class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.text :content, null: false, limit: 500

      t.timestamps
    end
    add_index :comments, [:user_id, :recipe_id]
  end
end
