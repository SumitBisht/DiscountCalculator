class Bill
	attr_accessor :user
	def initialize(user=nil)
		@grocery_costs = 0.0
		@other_costs = 0.0
		@user= user
	end
	def add_item(item, category, quantity, price)
		@other_costs += Float(quantity * price) if category != "groceries"
		@grocery_costs += Float(quantity * price) if category == "groceries"
	end

	def total_cost
		Float(@other_costs + @grocery_costs)
	end
	def non_grocery_cost
		@other_costs
	end

	def net_payable_amount
		if @user != nil
			disc_amt = Float(@other_costs * @user.discount()/100)
			total = total_cost() - disc_amt
			total = Float(total - 5*(Integer(total)/100)) if total >100.0
			return total
		end
		total_cost()
	end
end