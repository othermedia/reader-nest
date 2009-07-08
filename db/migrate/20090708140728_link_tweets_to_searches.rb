class LinkTweetsToSearches < ActiveRecord::Migration
  def self.up
    add_column :tweets, :search_id, :integer
    add_index  :tweets, [:search_id, :created_at]
  end

  def self.down
    remove_column :tweets, :search_id
    remove_index  :tweets, [:search_id, :created_at]
  end
end
