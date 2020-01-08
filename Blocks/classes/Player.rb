class Player
	attr_accessor :name, :position, :inventory

	def initialize(new_name)
		@name = new_name
		@position = [0, 0]
	end

	def look
		puts "I am standing at: x#{@position[0]} and y#{@position[1]}"
	end

	def move(direction, world)
		tmp = @position
		case direction
		when "forward"
			@position[0] += 1
		when "backward"
			@position[0] += -1
		when "right"
			@position[1] += 1
		when "left"
			@position[1] += -1
		else
			puts "Not an acceptable direction"
		end
		self.look
		if world[@position[0]][@position[1]] == EmptyBlock || world[@position[0]][@position[1]] == nil
		 	@position = tmp
		 	puts "You cant move there!"
		end
	end

	def position(index)
		return @position[index]
	end

	def showInventory
		x = 0
		@inventory.each do |slot|
			x += 1
		puts "slot #{x} #{slot.name}"
		end
	end

	def gather(gatherd_block)

	end
end