class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_action :set_user
 before_action :allow_cross_origin_requests   #, if: proc { Rails.env.development? }

  def preflight
    render nothing: true
  end

  private

  def allow_cross_origin_requests
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    headers['Access-Control-Max-Age'] = '1728000'
    # if /\Ahttps?:\/\/localhost:8080\z/ =~ request.headers['HTTP_ORIGIN']
    #   p "************************"
    #   p headers['Access-Control-Allow-Origin']
    #   p "I'M HIT!"
    #   headers['Access-Control-Allow-Origin'] = request.headers['HTTP_ORIGIN']
    #   p headers['Access-Control-Allow-Origin']
    # end
  end

  def set_user
    if session[:user_id] == nil
      @user = User.new
    else
      @user = User.find(session[:user_id])
    end
    return @user
  end
end
