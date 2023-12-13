class CreateMonthlyDueTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :monthly_due_transactions do |t|
      t.string :is_paid
      t.belongs_to :user
      t.belongs_to :monthly_due
      t.timestamps
      
    end
  end
end
