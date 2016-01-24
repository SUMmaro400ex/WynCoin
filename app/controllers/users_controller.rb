class UsersController < ApplicationController
  skip_before_action :authenticate

  def new
    
  end

  def login
    @facebook_id = params[:facebook_id]
    @user = User.find_by(facebook_id: @facebook_id)
    if @user
      current_user = @user
      redirect_to @user
    else
      @user = User.new
      @user.name= params[:name]
      @user.save
      current_user = @user
    end
    redirect_to @user
  end

  def show

  end

end
