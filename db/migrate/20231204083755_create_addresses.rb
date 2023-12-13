class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :block
      t.string :lot
      t.string :street
      t.belongs_to :user
      t.timestamps
    end
  end
end
