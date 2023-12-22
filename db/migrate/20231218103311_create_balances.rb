class CreateBalances < ActiveRecord::Migration[7.1]
  def change
    create_table :balances do |t|
      t.float :amount
      t.string :user_id

      t.timestamps
    end
  end
end
