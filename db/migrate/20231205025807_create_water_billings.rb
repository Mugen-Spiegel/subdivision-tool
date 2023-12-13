class CreateWaterBillings < ActiveRecord::Migration[7.1]
  def change
    create_table :water_billings do |t|
      t.string :per_cubic_price
      t.string :is_current_price
      t.belongs_to :subdivision
      t.timestamps
    end

  end
end
