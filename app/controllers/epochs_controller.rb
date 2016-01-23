class EpochsController < ApplicationController
  def create
    account = @current_user
    user = User.find_by_facebook_id!(params[:user_facebook_token])
    Epoch.create(account: account, user: user)
    render json: { status: :ok }
  end
end
