class AddMoreCatsMoveToPosts < ActiveRecord::Migration
  def self.up
      add_column :posts, :cat4move, :integer, :default => 0
      add_column :posts, :cat5move, :integer, :default => 0
      add_column :posts, :cat6move, :integer, :default => 0
      add_column :posts, :hat4move, :integer, :default => 0
      add_column :posts, :hat5move, :integer, :default => 0
      add_column :posts, :hat6move, :integer, :default => 0
  end

  def self.down
      remove_column :posts, :cat4move
      remove_column :posts, :cat5move
      remove_column :posts, :cat6move
      remove_column :posts, :hat4move
      remove_column :posts, :hat5move
      remove_column :posts, :hat6move
  end
end
