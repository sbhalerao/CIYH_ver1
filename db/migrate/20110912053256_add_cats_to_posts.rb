class AddCatsToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :cat1x, :float, :default => 100
    add_column :posts, :cat1y, :float, :default => 100
    add_column :posts, :cat1h, :float, :default => 150
    add_column :posts, :cat1w, :float, :default => 115
    add_column :posts, :cat2x, :float, :default => 100
    add_column :posts, :cat2y, :float, :default => 100
    add_column :posts, :cat2h, :float, :default => 150
    add_column :posts, :cat2w, :float, :default => 115
    add_column :posts, :cat3x, :float, :default => 100
    add_column :posts, :cat3y, :float, :default => 100
    add_column :posts, :cat3h, :float, :default => 150
    add_column :posts, :cat3w, :float, :default => 115
  end

  def self.down
    remove_column :posts, :cat1w
    remove_column :posts, :cat1h
    remove_column :posts, :cat1y
    remove_column :posts, :cat1x
    remove_column :posts, :cat2w
    remove_column :posts, :cat2h
    remove_column :posts, :cat2y
    remove_column :posts, :cat2x
    remove_column :posts, :cat3w
    remove_column :posts, :cat3h
    remove_column :posts, :cat3y
    remove_column :posts, :cat3x
  end
end
