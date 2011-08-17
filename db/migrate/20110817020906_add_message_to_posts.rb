class AddMessageToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :message, :string
  end

  def self.down
    remove_column :posts, :message
  end
end
