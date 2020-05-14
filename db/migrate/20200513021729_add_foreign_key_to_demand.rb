class AddForeignKeyToDemand < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :demands, :products
  end
end
