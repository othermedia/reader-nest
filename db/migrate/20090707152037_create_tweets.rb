class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.datetime  :created_at,    :null => false
      t.string    :user,          :null => false
      t.text      :text,          :null => false
    end
  end

  def self.down
    drop_table :tweets
  end
end
