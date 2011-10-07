class CreateCatwalks < ActiveRecord::Migration
  def self.up
    create_table :catwalks do |t|
      t.string :catname

      t.timestamps
    end
  end

  def self.down
    drop_table :catwalks
  end
end
