class AddDemanderDemandedAssociation < ActiveRecord::Migration[6.0]
  def change
    add_reference :demands, :demander, foreign_key: { to_table: :users }
  end
end
