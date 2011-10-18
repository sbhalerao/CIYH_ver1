class AddMoreCatsMoveToPosts < ActiveRecord::Migration
  def self.up
      add_column :posts, :cat1move, :integer, :default => 0
      add_column :posts, :cat2move, :integer, :default => 0
      add_column :posts, :cat3move, :integer, :default => 0
      add_column :posts, :hat1move, :integer, :default => 0
      add_column :posts, :hat2move, :integer, :default => 0
      add_column :posts, :hat3move, :integer, :default => 0
  end

  def self.down
      remove_column :posts,  :cat1move
      remove_column :posts, :cat2move
      remove_column :posts, :cat3move
      remove_column :posts, :hat1move
      remove_column :posts, :hat2move
      remove_column :posts, :hat3move
  end
end
