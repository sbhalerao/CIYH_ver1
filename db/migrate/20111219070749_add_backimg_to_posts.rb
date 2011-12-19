class AddBackimgToPosts < ActiveRecord::Migration
  def self.up
     change_column :posts, :backimg, :string, :default => "#{RAILS_ROOT}/public/images/athens-sized.jpg"
  end

  def self.down
    change_column :posts, :backimg, :string, :default => "#{RAILS_ROOT}/public/images/catsback.png"
  end
end
