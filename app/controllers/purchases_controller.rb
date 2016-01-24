class PurchasesController < ApplicationController

	def create

	  @amount = 10

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount*100,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )
	  redirect_to root_path

	  if charge.paid
	  	@purchase = Purchase.new
	  	@purchase.user_id = current_user.id
	  	btc = CurrencyConverter.call(@amount, :usd)
	  	@purchase.amount = CurrencyConverter.call(btc, :btc)
	  	@purchase.save
	  end

	  rescue Stripe::CardError => e
	    flash[:error] = e.message
		
	end

end
