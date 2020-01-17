class Block
	# attr_accessor :name, :position, :harvest, :fortune
	attr_reader :name, :harvest, :fortune

	def look
		puts "You see a block of: " + @name
	end

	def mine
		puts "You picked up a block of: " + @harvest
		return self
	end

	# def name=(new_name)
	# 	if new_name.is_a?(Numeric)
	# 		puts "Name can't be a Number"
	# 	else 	
	# 		@name = new_name
	# 	end
	# end

end
	