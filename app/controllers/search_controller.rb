class SearchController < ApplicationController
  layout 'main'
  
  auth = Twitter::OAuth.new('none', 'such')
  TWIT = Twitter::Base.new(auth)
  
  def firehose
    @tweets = Twitter.firehose
  end
  
  def text
    @tweets = Twitter::Search.new(params[:q])
    render :action => 'firehose'
  end
  
  def user
    @tweets = TWIT.user_timeline(params)
    render :action => 'firehose'
  end
end
