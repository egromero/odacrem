class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :model_url
      t.string :certification_url
      t.text :description
      t.text :specifications

      t.timestamps
    end
  end
end
