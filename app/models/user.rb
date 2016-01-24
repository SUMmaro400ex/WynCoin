class User < ActiveRecord::Base
  	has_many :epochs
 	has_many :purchases
 	has_many :transactions, through: :epochs

  	def balance
    	inflow = self.purchases.pluck(:amount).reduce(:+) || 0
    	outflow = self.transactions.pluck(:amount).reduce(:+) || 0
    	inflow - outflow
	end

	def name=(full_name)
		self.first_name, self.last_name = full_name.split(" ")
	end

  def name
    self.first_name + " " + self.last_name
  end

end
