class CreateSearches < ActiveRecord::Migration
  def self.up
    create_table :searches do |t|
      t.belongs_to  :user
      t.string      :phrase,    :limit => 100,    :null => false
      t.timestamps
    end
    
    add_index :searches, :user_id
  end

  def self.down
    drop_table :searches
  end
end
