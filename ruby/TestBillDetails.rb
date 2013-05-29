require 'test/unit'

class TestBillDetails < Test::Unit::TestCase

	def setup
		@detailed_bill = Bill.new
		@detailed_bill.add_item('t-shirt', 'clothes', 2, 41.5)
		@detailed_bill.add_item('mineral water', 'groceries', 5, 10)
		@detailed_bill.add_item('The Illusionist', 'books', 1, 13.5)
		@detailed_bill.add_item('Chawanprash', 'groceries', 2, 17)
		@detailed_bill.add_item('Rice', 'groceries',6,22)
		@detailed_bill.add_item('wireless mouse', 'accessories',1,45)
		
		@empty = Bill.new
		@simple_bill = Bill.new
		@grocery_bill = Bill.new
		@bill_without_grocery = Bill.new
	end

	def teardown
		@detailed_bill = nil
		@empty = nil
	end


	def test_bill_completeness
		assert_instance_of ( Bill, @detailed_bill )
		assert_instance_of ( Bill, @empty )
		assert_not_nil ( @detailed_bill )
		assert_not_nil ( @empty )
		assert_equal ( 357.5, @detailed_bill.cost )
		assert_equal ( 0, @empty.cost )
	end

	def test_costs_eligible_for_discounts
		assert_equal ( 0, @empty.discounted_cost )
		assert_equal ( 196.5, @detailed_bill.discounted_cost )
	end
end
