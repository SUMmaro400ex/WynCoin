class EpochsController < ApplicationController
  def create
    render json: { status: :ok }
  end
end
