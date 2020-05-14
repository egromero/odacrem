class AddAttributesToDemands < ActiveRecord::Migration[6.0]
  def change
    remove_column :demands, :amount
    add_column :demands, :expiry_at, :timestamp
    add_column :demands, :requested_amount, :decimal
    add_column :demands, :supplied_amount, :decimal
    add_column :demands, :promised_amount, :decimal
    add_column :demands, :description, :text
  end
end
