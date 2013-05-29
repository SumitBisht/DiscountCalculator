require 'test/unit'

class TestApplicableDiscount < Test::Unit::TestCase

	def setup
		@tarun = User.new('user', Time.new(2012, 4, 25) )
		@ravi = User.new('employee', Time.new(2011, 5, 5) )
		@vijay = User.new('affiliate', Time.new(2010,12, 9) )
		@rafiq = User.new('user', Time.new(2010, 8, 26) )
		@dave = User.new('affiliate', Time.new(2011,4,16) )
	end

	def teardown
		@tarun = nil
		@ravi = nil
		@vijay = nil
		@rafiq = nil
		@dave = nil
	end

	def test_basic_applicable_discounts
		assert_instance_of ( Person, @tarun )
		assert_instance_of ( Person, @ravi )
		assert_instance_of ( Person, @vijay )
		assert_instance_of ( Person, @rafiq )
		assert_instance_of ( Person, @dave )

		assert_equal(30, @ravi.discount)
		assert_equal(10, @vijay.discount)
		assert_equal(10, @dave.discount)
		assert_equal(5, @rafiq.discount)
		assert_equal(0, @tarun.discount)
	end

end
