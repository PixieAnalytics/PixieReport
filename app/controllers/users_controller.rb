class UsersController < ApplicationController
  include ActiveModel::SecurePassword
  has_secure_password
 def new
  end

  def create
  end

  def signin
    user = User.where(:domain == params[:domain])[0]
    p user
    redirect_to "/"
  end

  def signout
  end

  private

  def permitted_users_params
    params.require(:domain, :password, :email, :name)
  end
end
