require 'rubygems'
require 'twitter'
require 'active_record'
require 'yaml'

require File.dirname(__FILE__) + '/../app/models/tweet'

class TwitterBot
  auth   = Twitter::OAuth.new('none', 'such')
  Client = Twitter::Base.new(auth)
  
  INTERVAL = 5
  
  def initialize(params = {})
    @params = params
  end
  
  def query
    if @params[:q]
      Twitter::Search.new(@params[:q])
    else
      Client.user_timeline(@params)
    end
  end
  
  def run(env = 'development')
    connect_to_database(env)
    loop do
      process_results(query)
      sleep(INTERVAL)
    end
  end
  
private
  
  def process_results(results)
    results.each do |tweet|
      time = Date.parse(tweet.created_at)
      in_db = Tweet.find_by_user_and_created_at(tweet.from_user, time)
      next unless in_db.nil?
      Tweet.create(:user => tweet.from_user, :text => tweet.text, :created_at => time)
    end
  end
  
  def connect_to_database(env)
    yaml = File.read(File.dirname(__FILE__) + "/../config/database.yml")
    config = YAML.load(yaml)[env]
    ActiveRecord::Base.establish_connection(config)
  end
end

