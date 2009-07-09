class SearchController < ApplicationController
  layout 'main'
  before_filter :check_logged_in, :except => %w[firehose]
  
  def firehose
    @tweets = Twitter.firehose
  end
  
  def index
    @searches = @user.searches
  end
  
  def create
    return @search = Search.new unless request.post?
    @search = @user.searches.create(params[:search])
    redirect_to :action => 'index'
  end
  
  def show
    @search = Search.find(params[:id])
    @tweets = @search.tweets.paginate(:all, :order    => 'created_at DESC',
                                            :per_page => 25,
                                            :page     => params[:page])
  end
end
