module UserType
	EMPLOYEE = 1
	AFFILIATE = 2
	CUSTOMER = 3
end
class User
	include UserType
	def initialize(type, time)
		@type = type
		@time = time
	end

	def discount()
		return 30 if @type == UserType::EMPLOYEE
		return 10 if @type == UserType::AFFILIATE
		return 5 if @type == UserType::CUSTOMER && Time.now-(2*60*60*24*365)>@time 	
		0
	end
end