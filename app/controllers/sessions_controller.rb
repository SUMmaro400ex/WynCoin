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
      user = Account.find_by_email(user_email).authenticate(user_password)
    when "user"
      user = User.find_by(facebook_id: params[:facebook_id]) || register_user
    end

    if user
      @current_user = user
      session[:user_id] = user.id
      session[:user_type] = user_type.to_sym
      flash[:message] = "Logged in."
      redirect_to_profile
    else
      flash[:error] = "Invalid Username or Password"
      redirect_to login_path
    end
  end

   def destroy
    session[:user_id] = nil
    session[:user_type] = nil
    flash[:message] = "Logged out."
    redirect_to login_path
  end

  private

  def register_user
      user = User.new
      user.name= params[:name]
      user.facebook_id = params[:facebook_id]
      user.save
      user
  end
end
