class AddProductToDemands < ActiveRecord::Migration[6.0]
  def change
    remove_column :demands, :product
    add_reference :demands, :product
  end
end
