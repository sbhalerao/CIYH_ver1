class AddCatsHatsToPosts < ActiveRecord::Migration
  def self.up
      change_column :posts, :cat1x, :float, :default => 100
      change_column :posts, :cat1y, :float, :default => 100
      change_column :posts, :cat1h, :float, :default => 100
      change_column :posts, :cat1w, :float, :default => 60
      change_column :posts, :cat2x, :float, :default => 100
      change_column :posts, :cat2y, :float, :default => 100
      change_column :posts, :cat2h, :float, :default => 115
      change_column :posts, :cat2w, :float, :default => 84
      change_column :posts, :cat3x, :float, :default => 100
      change_column :posts, :cat3y, :float, :default => 100
      change_column :posts, :cat3h, :float, :default => 100
      change_column :posts, :cat3w, :float, :default => 77
      change_column :posts, :hat1x, :float, :default => 100
      change_column :posts, :hat1y, :float, :default => 100
      change_column :posts, :hat1h, :float, :default => 42
      change_column :posts, :hat1w, :float, :default => 60
      change_column :posts, :hat2x, :float, :default => 100
      change_column :posts, :hat2y, :float, :default => 100
      change_column :posts, :hat2h, :float, :default => 58
      change_column :posts, :hat2w, :float, :default => 75
      change_column :posts, :hat3x, :float, :default => 100
      change_column :posts, :hat3y, :float, :default => 100
      change_column :posts, :hat3h, :float, :default => 87
      change_column :posts, :hat3w, :float, :default => 75
    add_column :posts, :cat4x, :float, :default => 100
    add_column :posts, :cat4y, :float, :default => 100
    add_column :posts, :cat4h, :float, :default => 90
    add_column :posts, :cat4w, :float, :default => 106
    add_column :posts, :cat5x, :float, :default => 100
    add_column :posts, :cat5y, :float, :default => 100
    add_column :posts, :cat5h, :float, :default => 120
    add_column :posts, :cat5w, :float, :default => 106
    add_column :posts, :cat6x, :float, :default => 100
    add_column :posts, :cat6y, :float, :default => 100
    add_column :posts, :cat6h, :float, :default => 104
    add_column :posts, :cat6w, :float, :default => 120
    add_column :posts, :hat4x, :float, :default => 100
    add_column :posts, :hat4y, :float, :default => 100
    add_column :posts, :hat4h, :float, :default => 76
    add_column :posts, :hat4w, :float, :default => 70
    add_column :posts, :hat5x, :float, :default => 100
    add_column :posts, :hat5y, :float, :default => 100
    add_column :posts, :hat5h, :float, :default => 42
    add_column :posts, :hat5w, :float, :default => 75
    add_column :posts, :hat6x, :float, :default => 100
    add_column :posts, :hat6y, :float, :default => 100
    add_column :posts, :hat6h, :float, :default => 53
    add_column :posts, :hat6w, :float, :default => 70
  end

  def self.down
    remove_column :posts, :cat4x
    remove_column :posts, :cat4y
    remove_column :posts, :cat4h
    remove_column :posts, :cat4w
    remove_column :posts, :cat5x
    remove_column :posts, :cat5y
    remove_column :posts, :cat5h
    remove_column :posts, :cat5w
    remove_column :posts, :cat6x
    remove_column :posts, :cat6y
    remove_column :posts, :cat6h
    remove_column :posts, :cat6w
    remove_column :posts, :hat4x
    remove_column :posts, :hat4y
    remove_column :posts, :hat4h
    remove_column :posts, :hat4w
    remove_column :posts, :hat5x
    remove_column :posts, :hat5y
    remove_column :posts, :hat5h
    remove_column :posts, :hat5w
    remove_column :posts, :hat6x
    remove_column :posts, :hat6y
    remove_column :posts, :hat6h
    remove_column :posts, :hat6w
  end
end
