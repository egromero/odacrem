class AddDonationToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fab_donations, :integer, :default => 0
  end
end
