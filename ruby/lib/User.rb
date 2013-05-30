class User
	def initialize(type, time)
		@type = type
		@time = time
	end

	def discount()
		return 30 if @type == "employee"
		return 10 if @type == "affiliate"
		return 5 if @type == "customer" && Time.now-(2*60*60*24*365)>@time 	
		0
	end
end