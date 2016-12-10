class Transaction < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :user
      t.integer :item_ids, array: true
      t.timestamps null: false
    end
  end
end
