class AddTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :type, :integer, default: 1
  end
end
