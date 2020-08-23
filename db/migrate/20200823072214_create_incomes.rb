class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|

      t.integer :user_id, null: false
      t.integer :user_group_id
      t.date :salary_date, null: false
      t.string :salary_name, null: false
      t.integer :income_amount, null: false
      t.boolean :del_flg, default: false
      t.timestamps
    end
  end
end
