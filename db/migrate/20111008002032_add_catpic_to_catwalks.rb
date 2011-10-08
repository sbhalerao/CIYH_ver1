class AddCatpicToCatwalks < ActiveRecord::Migration
    def self.up
      add_column :catwalks, :catpic_file_name, :string
      add_column :catwalks, :catpic_content_type, :string
      add_column :catwalks, :catpic_file_size, :integer
      add_column :catwalks, :catpic_updated_at,   :datetime
    end

    def self.down
      remove_column :catwalks, :catpic_file_size
      remove_column :catwalks, :catpic_content_type
      remove_column :catwalks, :catpic_file_name
      remove_column :catwalks, :catpic_updated_at
    end
  end
