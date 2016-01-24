class PurchasesController < ApplicationController

	def create
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )
	  redirect_to root_path

	  if charge.paid
	  	@purchase = Purchase.new
	  	@purchase.user_id = current_user.id
	  	@purchase.amount = @amount.to_f/10.0
	  	@purchase.save
	  end

	  rescue Stripe::CardError => e
	    flash[:error] = e.message
		
	end

end
