class UsersController < ApplicationController
  # include ActiveModel::SecurePassword
  # has_secure_password
  # attr_accessible :email, :password, :password_confirmation
  before_action :set_user

  def new
  end

  def create
  end

  def signin
    p permitted_users_params[:email]
    user = User.find_by_email(permitted_users_params[:email])
    if user && user.authenticate(permitted_users_params[:password])
      session[:user_id] = user.id
      redirect_to user, :notice => "Welcome back, #{user.email}"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def signout
  end

  private

  def permitted_users_params
    params.require(:user)
  end
end
