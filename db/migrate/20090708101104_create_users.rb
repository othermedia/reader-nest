class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :username,        :limit => 60,   :null => false
      t.string    :password_hash,   :limit => 40,   :null => false
      t.string    :password_salt,   :limit => 20,   :null => false
      t.timestamps
    end
    
    add_index :users, :username
  end

  def self.down
    drop_table :users
  end
end
