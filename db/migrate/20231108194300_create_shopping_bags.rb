class CreateShoppingBags < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_bags do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
