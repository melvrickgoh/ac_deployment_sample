class CreateShoppingCart < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_carts do |t|
      t.references :user
      t.integer :item_ids, array: true
      t.timestamps null: false
    end

    create_table :products do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.timestamps null: false
    end
  end
end
