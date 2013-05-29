require 'test/unit'
require '../lib/Bill'
require '../lib/User'

class TestComputedDiscounts < Test::Unit::TestCase

	def test_no_discounts
	end
	def test_old_customer_discounts
	end
	def test_employee_discounts
		bill = Bill.new(User.new('employee', Time.new(2012,4,3)))
		bill.add_item('bat', 'sports', 2, 50)
		bill.add_item('ball', 'sports', 5, 8)
		bill.add_item('stumps', 'sports', 6, 15)
		bill.add_item('bails', 'sports', 4, 5)
		assert_not_equal(250, bill.net_payable_amount)
		assert_equal(170, bill.net_payable_amount)

	end
	def test_affiliate_discounts
	end
	def test_bulk_purchase_discounts
	end
	def test_bulk_with_percentage_discounts
	end
end