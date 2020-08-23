class CreateSpendings < ActiveRecord::Migration[5.2]
  def change
    create_table :spendings do |t|

      t.integer :user_id, null: false
      t.integer :user_group_id
      t.date :purchase_date, null: false
      t.string :product_name, null: false
      t.integer :price, null: false
      t.boolean :del_flg, default: false
      t.timestamps
    end
  end
end
