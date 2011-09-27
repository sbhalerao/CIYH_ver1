class AddCatsToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :cat1x, :float, :default => 100
    add_column :posts, :cat1y, :float, :default => 100
    add_column :posts, :cat1h, :float, :default => 150
    add_column :posts, :cat1w, :float, :default => 115
  end

  def self.down
    remove_column :posts, :cat1w
    remove_column :posts, :cat1h
    remove_column :posts, :cat1y
    remove_column :posts, :cat1x
  end
end
