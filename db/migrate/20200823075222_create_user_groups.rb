class CreateUserGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_groups do |t|

      t.string :group_name, null: false
      t.boolean :del_flg, default: false
      t.timestamps
    end
  end
end
