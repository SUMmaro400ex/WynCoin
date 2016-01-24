class SessionsController < ApplicationController
  skip_before_action :authenticate
  def new

  end
  def create
    user_password = params[:password]
    user_email = params[:email]
    user_type = params[:user_type]
    case user_type
    when "account"
      user = Account.find_by_email(user_email)
    when "user"
      user = User.find_by_email(user_email)
    end

    if user && user.authenticate(user_password)
      @current_user = user
      session[:user_id] = user.id
      session[:user_type] = user_type.to_sym
      flash[:message] = "Logged in."
      redirect_to_profile
    else
      flash[:error] = "Invalid Username or Password"
      render :login
    end
  end

   def destroy
    session[:user_id] = nil
    session[:user_type] = nil
    flash[:message] = "Logged out."
    redirect_to login_path
  end
end
