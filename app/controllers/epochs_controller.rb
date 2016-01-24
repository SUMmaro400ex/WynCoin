class EpochsController < ApplicationController
  before_filter :find_account
  before_filter :find_epoch_by_token
  before_filter :find_user
  def create
    user = User.find_by_facebook_id!(params[:user_facebook_token])
    epoch = Epoch.create(account: @account, user: user)
    render json: { status: :ok, epoch_token: epoch.token, user_balance: user.balance }
  end

  def close
    CloseEpoch.call(@epoch)
    render json: { status: :ok, user_balance: @user.balance, epoch_amount: @epoch.amount  }
  end

  private

  def find_account
    @account = @current_user if @current_user.class == Account
  end

  def find_user
    if params[:user_facebook_token]
      @user = User.find_by_facebook_id!(params[:user_facebook_token])
    elsif @epoch
      @user = @epoch.user
    end
  end
  def find_epoch_by_token
    @epoch = Epoch.find_by_token(params[:epoch_token]) if params[:epoch_token]
  end
end
