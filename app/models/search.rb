require 'twitter'

class Search < ActiveRecord::Base
  belongs_to :user
  has_many :tweets, :dependent => :destroy
  validates_length_of :phrase, :within => 1..100
  
  def poll
    Twitter::Search.new(phrase).each { |r| process_tweet(r) }
  end
  
private
  
  def process_tweet(tweet)
    time = Time.parse(tweet.created_at).strftime('%Y-%m-%d %H:%M:%S')
    user = tweet.user ? tweet.user.screen_name : tweet.from_user
    
    in_db = Tweet.find_by_user_and_created_at(user, time)
    return unless in_db.nil?
    
    tweets.create(:user => user, :text => tweet.text, :created_at => time)
  end
end

