class HospitalUserRequest < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.string :hospital_name

      t.timestamps
    end
  end
end
