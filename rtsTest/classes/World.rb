class Player
	attr_accessor :world

	def initialize()
	end

	def generateWorld
		@world = Array.new(10) { Array.new(10, DirtBlock.new) }
		x = 0
		# Place Stone blocks
		while x <= 40 do
			@world[rand(1..world.length-2)][rand(1..world[0].length-2)] = StoneBlock.new
			x +=1
		end
		x = 0
		# Place ??? blocks
		while x <= 30 do
			@world[rand(2..world.length-3)][rand(2..world[0].length-3)] = StoneBlock.new
			x +=1
		end
		x = 0
		# Place Objectives blocks
		while x <= 5 do
			@world[rand(3..world.length-4)][rand(3..world[0].length-4)] = DiamondBlock.new
			x +=1
		end
		puts "New world generated"
	end

	def look
		puts "I am standing on a block of #{world[@position[0]][@position[1]].name}."
		puts "And my position is: x#{@position[0]} and y#{@position[1]}"
	end

	def fullScout
		puts "Here the full map of the world: \n\n"
		map = ""
		Array(0..world.length).each { |x| map += x.to_s + "   " }
		puts map
		x = 0
		while x <= world.length-1
			y = 0
			if x <9
				map = "#{x+1}  "
			elsif x <99 and x >= 9
				map = "#{x+1} "
			else
				map = "#{x+1}"
			end
			# print a full column
			while y <= world[x].length-1
				print map = world[x][y].scout	
				y+=1
			end
			# puts 1 row
			puts map
			# go to next column
			x+=1
		end
	end

	def move(direction, distance)
		resetPosition = Array.new(@position)
		x = 0
		while x < distance do
			case direction
			when "left"
				@position[0] += -1
			when "right"
				@position[0] += 1
			when "forward"
				@position[1] += 1
			when "backward"
				@position[1] += -1
			when "help"
				puts "You can gather from these directions: forward, backward, right, left"
			when "quit" || "stop" || "exit"
				return true
			else 
				return false
			end
			self.look
			self.checkOffWorld(resetPosition)
			x += +1
		end
		return true
	end

	def checkOffWorld(resetPosition)
		if @position[0] == 11
			@position[0] = 0
		elsif @position[1] == 11
			@position[1] = 0
		elsif  @world[@position[0]][@position[1]] == nil || @world[@position[0]][@position[1]].name == "Air" 
		 	@world[@position[0]][@position[1]].look
		 	puts "You cant move there!"
			@position = resetPosition
		end
	end

	def position(index)
		return @position[index]
	end

end