require 'test/unit'
require '../lib/Bill'
require '../lib/User'

class TesBill < Test::Unit::TestCase

	def setup
		@empty_bill = Bill.new
		
		@grocery_bill = Bill.new
		@grocery_bill.add_item('milk', 'groceries', 1, 30)
		@grocery_bill.add_item('coffee', 'groceries', 3, 12)
		@grocery_bill.add_item('honey', 'groceries', 1, 15)
		@grocery_bill.add_item('jam', 'groceries', 1, 14)
		
		@non_grocery_bill = Bill.new
		@non_grocery_bill.add_item('bat', 'sports', 2, 100)
		@non_grocery_bill.add_item('ball', 'sports', 5, 25)
		@non_grocery_bill.add_item('stump', 'sports', 6, 15)
		@non_grocery_bill.add_item('bail', 'sports', 4, 5)
		@non_grocery_bill.add_item('racket', 'sports', 2, 150)
		@non_grocery_bill.add_item('stick', 'sports', 10, 24)
		
		@complete_bill = Bill.new
		@complete_bill.add_item('milk', 'groceries', 1, 30)
		@complete_bill.add_item('coffee', 'groceries', 3, 12)
		@complete_bill.add_item('honey', 'groceries', 1, 150)
		@complete_bill.add_item('jam', 'groceries', 2, 44)
		@complete_bill.add_item('bat', 'sports', 2, 100)
		@complete_bill.add_item('ball', 'sports', 5, 25)
		@complete_bill.add_item('stump', 'sports', 6, 15)
		@complete_bill.add_item('bail', 'sports', 4, 5)
		@complete_bill.add_item('racket', 'sports', 2, 150)
		@complete_bill.add_item('stick', 'sports', 10, 24)
		@customer = User.new('customer', Time.new(2012, 4, 25) )
		@old_customer = User.new('customer', Time.new(2010, 8, 26))
		@employee = User.new('employee', Time.new(2011, 5, 5) )
		@affiliate = User.new('affiliate', Time.new(2010,12, 9) )
	end
	def teardown
		@empty_bill = nil
		@grocery_bill = nil
		@non_grocery_bill = nil
		@complete_bill = nil
	end
	def test_bill_details
		assert_equal(0.0, @empty_bill.total_cost)
		assert_equal(0.0, @empty_bill.non_grocery_cost)
		assert_equal(0.0, @empty_bill.net_payable_amount)

		assert_equal(95, @grocery_bill.total_cost)
		assert_equal(0.0, @grocery_bill.non_grocery_cost)
		assert_equal(95, @grocery_bill.net_payable_amount)

		assert_equal(975, @non_grocery_bill.total_cost)
		assert_equal(975, @non_grocery_bill.non_grocery_cost)
		assert_equal(975, @non_grocery_bill.net_payable_amount)

		assert_equal(1279, @complete_bill.total_cost)
		assert_equal(975, @complete_bill.non_grocery_cost)
		assert_equal(1279, @complete_bill.net_payable_amount)
	end
	def test_bill_item_addition
		assert_equal(0, @empty_bill.total_cost)
		assert_equal(0, @empty_bill.non_grocery_cost)
		assert_equal(0, @empty_bill.net_payable_amount)
		@empty_bill.add_item('bat', 'sports', 2, 100)
		@empty_bill.add_item('pickle', 'groceries', 1, 50)
		assert_equal(250, @empty_bill.total_cost)
		assert_equal(200, @empty_bill.non_grocery_cost)
		assert_equal(250, @empty_bill.net_payable_amount)
	end
	def test_no_discounts
		assert_equal(0.0, @empty_bill.net_payable_amount)
		@empty_bill.user = @customer
		assert_equal(0.0, @empty_bill.net_payable_amount)
		@empty_bill.user = @old_customer
		assert_equal(0.0, @empty_bill.net_payable_amount)
		@empty_bill.user =@employee
		assert_equal(0.0, @empty_bill.net_payable_amount)
		@empty_bill.user = @affiliate
		assert_equal(0.0, @empty_bill.net_payable_amount)
	end
	def test_old_customer_discounts
		assert_equal(95.0, @grocery_bill.net_payable_amount)
		@grocery_bill.user = @old_customer
		assert_equal(95.0, @grocery_bill.net_payable_amount)

		assert_equal(975.0, @non_grocery_bill.net_payable_amount)
		@non_grocery_bill.user = @old_customer
		assert_equal(881.25, @non_grocery_bill.net_payable_amount)
		
		assert_equal(1279.0, @complete_bill.net_payable_amount)
		@complete_bill.user = @old_customer
		assert_equal(1170.25, @complete_bill.net_payable_amount)
	end

	def test_employee_discounts
		assert_equal(95.0, @grocery_bill.net_payable_amount)
		@grocery_bill.user = @employee
		assert_equal(95.0, @grocery_bill.net_payable_amount)

		assert_equal(975.0, @non_grocery_bill.net_payable_amount)
		@non_grocery_bill.user = @employee
		assert_equal(652.5, @non_grocery_bill.net_payable_amount)
		
		assert_equal(1279.0, @complete_bill.net_payable_amount)
		@complete_bill.user = @employee
		assert_equal(941.5, @complete_bill.net_payable_amount)
	end

	def test_affiliate_discounts
		assert_equal(95.0, @grocery_bill.net_payable_amount)
		@grocery_bill.user = @affiliate
		assert_equal(95.0, @grocery_bill.net_payable_amount)

		assert_equal(975.0, @non_grocery_bill.net_payable_amount)
		@non_grocery_bill.user = @affiliate
		assert_equal(837.5, @non_grocery_bill.net_payable_amount)
		
		assert_equal(1279.0, @complete_bill.net_payable_amount)
		@complete_bill.user = @affiliate
		assert_equal(1126.5, @complete_bill.net_payable_amount)
	end
end