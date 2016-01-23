class BerlynsController < ApplicationController

  def begin
    auth_token = params[:token]
    facebook_id = params[:facebook_id]

    render json: balance , status: 200
  end

  def unit_bill
  end

end
