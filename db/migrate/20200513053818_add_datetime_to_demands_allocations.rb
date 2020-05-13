class AddDatetimeToDemandsAllocations < ActiveRecord::Migration[6.0]
  def change
    add_column :demands, :expiry_at, :datetime
    add_column :allocations, :promised_at, :datetime
  end
end
