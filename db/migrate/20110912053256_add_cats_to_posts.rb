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
    add_column :posts, :hat1x, :float, :default => 100
    add_column :posts, :hat1y, :float, :default => 100
    add_column :posts, :hat1h, :float, :default => 150
    add_column :posts, :hat1w, :float, :default => 115
    add_column :posts, :hat2x, :float, :default => 100
    add_column :posts, :hat2y, :float, :default => 100
    add_column :posts, :hat2h, :float, :default => 150
    add_column :posts, :hat2w, :float, :default => 115
    add_column :posts, :hat3x, :float, :default => 100
    add_column :posts, :hat3y, :float, :default => 100
    add_column :posts, :hat3h, :float, :default => 150
    add_column :posts, :hat3w, :float, :default => 115
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
    remove_column :posts, :hat1w
    remove_column :posts, :hat1h
    remove_column :posts, :hat1y
    remove_column :posts, :hat1x
    remove_column :posts, :hat2w
    remove_column :posts, :hat2h
    remove_column :posts, :hat2y
    remove_column :posts, :hat2x
    remove_column :posts, :hat3w
    remove_column :posts, :hat3h
    remove_column :posts, :hat3y
    remove_column :posts, :hat3x
  end
end
