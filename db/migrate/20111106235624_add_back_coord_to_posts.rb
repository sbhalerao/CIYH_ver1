class AddBackCoordToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :backx, :float
    add_column :posts, :backy, :float
  end

  def self.down
    remove_column :posts, :backx
    remove_column :posts, :backy
  end
end
