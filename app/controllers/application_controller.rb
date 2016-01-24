class ApplicationController < ActionController::Base
  before_filter :authenticate
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers
  skip_before_filter :verify_authenticity_token
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  protected

  def authenticate
    if current_user.nil?
      respond_to do |format|
        format.html { flash[:error] = 'Not authorized.'; redirect_to '/home' }
        format.json { render json: { errors: "Not authenticated" }, status: :unauthorized }
      end
    end
  end

  def current_user
    if session[:user_id] && session[:user_type] == "user"
      @current_user = User.find(session[:user_id])
    elsif session[:user_id] && session[:user_type] == "account"
      @current_user = Account.find(session[:user_id])
    else
      @current_user = authenticate_acount_with_token
    end
  end

  def authenticate_acount_with_token
    authenticate_with_http_token do |token, options|
      Account.find_by(api_token: token)
    end
  end

  def redirect_to_profile(user = @current_user)
    case user.class.name
    when "Account"
      redirect_to account_path(user)
    when "User"
      redirect_to user_path(user)
    end
  end

   def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

   def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'
    end
  end
end
