class RemoveIndexThumbsUp < ActiveRecord::Migration
  def self.up
    remove_index :votes, ["voter_id", "voter_type", "voteable_id", "voteable_type"]
  end

  def self.down
    add_index :votes, ["voter_id", "voter_type", "voteable_id", "voteable_type"], :unique => true, :name => "uniq_one_vote_only"
  end
end
