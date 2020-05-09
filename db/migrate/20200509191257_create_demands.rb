class CreateDemands < ActiveRecord::Migration[6.0]
  def change
    create_table :demands do |t|
      t.string :product
      t.decimal :amount

      t.timestamps
    end
  end
end
