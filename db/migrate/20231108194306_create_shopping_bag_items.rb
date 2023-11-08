class CreateShoppingBagItems < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_bag_items do |t|
      t.references :shopping_bag, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.decimal :quantity
      t.string :unit, limit: 50
      t.boolean :purchased, default: false
      t.string :notes

      t.timestamps
    end
  end
end
