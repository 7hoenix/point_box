class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, default: 0
    add_column :users, :points, :integer, default: 0
    add_column :users, :redeemed_points, :integer, default: 0
  end
end
