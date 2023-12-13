class CreateWaterBillingTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :water_billing_transactions do |t|
      t.string :current_reading
      t.string :previous_reading
      t.belongs_to :user
      t.belongs_to :subdivision
      t.belongs_to :water_billing
      t.timestamps
    end
  end
end
