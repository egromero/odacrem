class RemoveTimestampsFromDemandsAllocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :demands, :expiry_at
    remove_column :allocations, :promised_at
  end
end
