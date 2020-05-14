class AddForeignKeyToAllocations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :allocations, :users
    add_foreign_key :allocations, :demands
  end
end
