class EpochsController < ApplicationController
  def create
    account = @current_user
    user = User.find_by_facebook_id!(params[:user_facebook_token])
    epoch = Epoch.create(account: account, user: user)
    render json: { status: :ok, epoch_token: epoch.token, user_balance: user.balance }
  end
end
