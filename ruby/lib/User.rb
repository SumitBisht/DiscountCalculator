class User
	def initialize(name, time)
		@name = name
		@time = time
	end

	def discount()
		return 30 if @name == "employee"
		return 10 if @name == "affiliate"
		return 5 if @name == "customer" && Time.now-(2*60*60*24*365)>@time 	
		0
	end
end