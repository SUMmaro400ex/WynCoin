class TransactionsController < ApplicationController
  before_filter :find_epoch
  def create
    @epoch.transactions.create(amount: params[:amount])
    render json: { status: :ok, user_balance: @epoch.user.balance }
  end

  private
  def find_epoch
    @epoch = Epoch.find_by_token(params[:epoch_token])
  end
end
