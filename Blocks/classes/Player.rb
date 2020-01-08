class Player
	attr_accessor :name, :position, :inventory, :activeInventory

	def initialize(new_name)
		@name = new_name
		@position = [0, 0]
		@activeInventory = 0
	end

	def look
		puts "I am standing at: x#{@position[0]} and y#{@position[1]}"
	end

	def scout(world)
		puts "I am standing at: x#{@position[0]} and y#{@position[1]}"
		puts "In front of me is x#{@position[0]} and y#{(@position[1]+1)}"
		world[@position[0]][(@position[1]+1)].look
		puts "Behind me is x#{@position[0]} and y#{(@position[1]-1)}" 
		world[@position[0]][(@position[1]-1)].look
		puts "To the right of me is x#{@position[0]+1} and y#{(@position[1])}"
		world[(@position[0]+1)][@position[1]].look
		puts "To the left of me is x#{@position[0]-1} and y#{(@position[1])}"
		world[(@position[0]-1)][@position[1]].look
	end

	def move(direction, world)
		tmp = @position
		case direction
		when "right"
			@position[0] += 1
		when "left"
			@position[0] += -1
		when "forward"
			@position[1] += 1
		when "backward"
			@position[1] += -1
		else
			puts "Not an acceptable direction"
		end
		self.look
		if world[@position[0]][@position[1]].name == "Air" || world[@position[0]][@position[1]] == nil
		 	@position = tmp
		 	puts "You cant move there!"
		 	self.look
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

	def gather(direction, world)
		case direction
		when "forward"
			block = world[(@position[0]+1)][@position[1]]
			world[(@position[0]+1)][@position[1]] = EmptyBlock.new
		when "backward"
			block = world[(@position[0]+1)][@position[1]]
		when "right"
			block = world[(@position[0]+1)][@position[1]]
		when "left"
			block = world[(@position[0]+1)][@position[1]]
		else
			puts "Not an acceptable direction"
		end
		return block = block.mine
	end
end