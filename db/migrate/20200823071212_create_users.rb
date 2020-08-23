class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string :name, null: false
      t.string :password, null: false, unique: true
      t.integer :group_id
      t.boolean :del_flg,  default: false
      t.timestamps
    end
  end
end
