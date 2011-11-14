class AddBackImgToPosts < ActiveRecord::Migration
  def self.up
     add_column :posts, :backimg, :string, :default => "#{RAILS_ROOT}/public/images/catsback.png"
  end

  def self.down
    remove_column :posts, :backimg
  end
end
