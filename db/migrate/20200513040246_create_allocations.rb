class CreateAllocations < ActiveRecord::Migration[6.0]
  def change
    create_table :allocations do |t|
      t.belongs_to :user
      t.belongs_to :demand
      t.decimal :amount
      t.timestamp :promised_at
      t.integer :status

      t.timestamps
    end
  end
end
