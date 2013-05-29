require 'test/unit'
require '../lib/Bill'
class TestBillDetails < Test::Unit::TestCase

	def setup
		@detailed_bill = Bill.new
		@detailed_bill.add_item('t-shirt', 'clothes', 2, 41.5)
		@detailed_bill.add_item('mineral water', 'groceries', 5, 10)
		@detailed_bill.add_item('The Illusionist', 'books', 1, 13.5)
		@detailed_bill.add_item('Health powder', 'groceries', 2, 17)
		@detailed_bill.add_item('Rice', 'groceries',6,22)
		@detailed_bill.add_item('wireless mouse', 'accessories',1,45)
		
		@empty = Bill.new
		@grocery_bill = Bill.new
		@grocery_bill.add_item('Soap', 'groceries', 10, 5.5)
		@grocery_bill.add_item('Toothpaste', 'groceries', 1, 5)
		@grocery_bill.add_item('Noodles', 'groceries', 10, 15)
		@grocery_bill.add_item('Cornflakes', 'groceries', 2, 8)
		@grocery_bill.add_item('Dry Fruits', 'groceries', 1, 89)
		@grocery_bill.add_item('Sugar', 'groceries', 3, 24)
		@bill_without_grocery = Bill.new
		@bill_without_grocery.add_item('Duct Tape', 'utility', 2, 10)
		@bill_without_grocery.add_item('Adhesive', 'utility', 0, 0)
		@bill_without_grocery.add_item('Nails', 'utility', 50, 0.4)
		@bill_without_grocery.add_item('Drill bit', 'utility', 3, 41)
		@bill_without_grocery.add_item('Plier', 'utility', 1, 7)
		@bill_without_grocery.add_item('Wallpaper', 'decoration', 4, 100)
	end

	def teardown
		@detailed_bill = nil
		@empty = nil
		@grocery_bill = nil
		@bill_without_grocery = nil
	end


	def test_bill_completeness
		assert_instance_of(Bill, @detailed_bill)
		assert_instance_of(Bill, @empty)
		assert_instance_of(Bill, @grocery_bill)
		assert_instance_of(Bill, @bill_without_grocery)
		assert_not_nil(@detailed_bill)
		assert_not_nil(@empty)
		assert_equal(357.5, @detailed_bill.cost)
		assert_equal(0, @empty.cost)
		assert_equal(387, @grocery_bill.cost)
		assert_equal(570, @bill_without_grocery.cost)
	end

	def test_costs_eligible_for_discounts
		assert_equal(0, @empty.non_grocery_cost)
		assert_equal(141.5, @detailed_bill.non_grocery_cost)
		assert_equal(0,@grocery_bill.non_grocery_cost)
		assert_equal(570,@bill_without_grocery.non_grocery_cost)
	end
end
