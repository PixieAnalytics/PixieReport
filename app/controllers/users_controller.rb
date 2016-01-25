class UsersController < ApplicationController
  # include ActiveModel::SecurePassword
  # has_secure_password
  # attr_accessible :email, :password, :password_confirmation
  before_action :set_user
  # def index
  # end
  # def new
  # end

  def show
    if @user.id != session[:user_id]
      redirect_to '/', flash: {error: "You do not have access to this page"}
    end
  end

  def create
    @user = User.create(name: user_params[:name], email: user_params[:email], password: user_params[:password])
    session[:user_id] = @user.id
    redirect_to @user
  end

  def signin
    user = User.find_by_email(user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to user, :notice => "Welcome back, #{user.email}"
    else
      # flash.now.alert = "Invalid email or password"
      redirect_to '/', flash: { :error => "Invalid email or password" }
    end
  end

  def signout
    session[:user_id] = nil
    redirect_to "/"
  end

  private

  def user_params
    params.require(:user)
  end
end
