class IndexTweets < ActiveRecord::Migration
  def self.up
    add_index :tweets, [:user, :created_at]
  end

  def self.down
    remove_index :tweets, [:user, :created_at]
  end
end
