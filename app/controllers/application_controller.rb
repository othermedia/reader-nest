# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def get_user
    @user = User.find(session[:user])
  rescue
  end
  before_filter :get_user
  
  def check_logged_in
    redirect_to :controller => 'users', :action => 'login' unless @user
  end
end
