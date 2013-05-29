class Bill
	def initialize(user=nil)
		@grocery_costs = 0
		@other_costs = 0
		@user= user
	end
	def add_item(item, category, quantity, price)
		@other_costs += quantity * price if category != "groceries"
		@grocery_costs += quantity * price if category == "groceries"
	end

	def cost
		@other_costs + @grocery_costs
	end
	def non_grocery_cost
		@other_costs
	end

	def net_payable_amount
		if @user != nil
			percentage_disc = non_grocery_cost() * @user.discount()/100
			total_cost = cost() - percentage_disc
			total_cost = total_cost - (total_cost/100)*5
			return total_cost
		end
		cost()
	end
end