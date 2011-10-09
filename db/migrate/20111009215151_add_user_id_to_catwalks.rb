class AddUserIdToCatwalks < ActiveRecord::Migration
  def self.up
    add_column :catwalks, :user_id, :integer
  end

  def self.down
    remove_column :catwalks, :user_id
  end
end
