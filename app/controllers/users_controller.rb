class UsersController < ApplicationController
  layout 'main'
  
  def create
    return @user = User.new unless request.post?
    @user = User.create(params[:user])
    redirect_to :action => 'login' if @user.valid?
  end
  
  def login
    return unless request.post?
    user = User.find_by_username(params[:username])
    return flash.now[:error] = "No such user" if user.nil?
    return flash.now[:error] = "Incorrect password" unless user.has_password?(params[:password])
    session[:user] = user.id
    redirect_to :controller => 'search'
  end
end
