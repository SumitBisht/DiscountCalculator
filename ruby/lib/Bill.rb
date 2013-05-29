class Bill
	def initialize
		@grocery_costs = 0
		@other_costs = 0
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
end