class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_user

  private
  def set_user
    if session[:user_id] == nil
      @user = User.new
    else
      @user = User.find(session[:user_id])
    end
    return @user
  end
end
