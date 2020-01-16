class Player
	attr_accessor :name, :position, :inventory, :world

	def initialize(new_name)
		@name = new_name
		@position = [0, 0]

	end

	def generateWorld
		# requires controll on max range
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
		puts "I am standing at: x#{@position[0]} and y#{@position[1]}"
	end

	def scout
		puts "I have mapped my suroundings: "
		puts "I am facing this direction => \n\n"
		x = @position[0]-2
		while x <= @position[0]+2
			y = @position[1]-2
			map = ""
			# print a full column
			while y <= @position[1]+2
				map += world[x][y].name[0] + world[x][y].name[1] + world[x][y].name[2] + " "
				y+=1
			end
			# puts 1 row
			puts map
			# go to next column
			x+=1
		end
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
				map += world[x][y].name[0] + world[x][y].name[1] + world[x][y].name[2] + " "
				y+=1
			end
			# puts 1 row
			puts map
			# go to next column
			x+=1
		end
	end

	def craft()
		loop do
		puts "what do you want to create?"
		self.showInventory
			case gets.chomp.downcase.strip
			when "portal"
				if inventory[1].count >= 5
					puts "You created a protal back to your world!"
					puts "You stare at the portal in front of you and see your hometown it the distance..."
					loop do
						puts "Do you enter the portal?"
						tmp = gets.chomp.downcase.strip
						if tmp == "yes"
							puts "You won the game!!!"
							exit
						elsif tmp == "no"
							puts "Not yet..."
							break
						else 
							"Not an acceptable choice, please type 'yes' or 'no'"
						end
					end
				end
			else
				puts "Unkown item, try help for list of items you can create"
			end
		end
	end

	def move()
		resetPosition = Array.new(@position)
		loop do
		puts "Which direction do you want to move in?"
		direction = gets.chomp.downcase.strip
		puts "\nHow far do you want to move?"
		puts "You have enough stanima to move up to 3 spaces at a time"
			distance = gets.chomp.to_i
			if distance.is_a?(Integer)
				if distance >= 1 and distance <= 3
					x = 0
					while x <= distance do
						case direction
						when "left"
							@position[0] += 1
						when "right"
							@position[0] += -1
						when "forward"
							@position[1] += 1
						when "backward"
							@position[1] += -1
						else
							puts "Not an acceptable direction"
						end
						self.look
						self.checkOffWorld(resetPosition)
						x += +1
					end
					return
				else
					puts "You cant move that far!"
				end
			else
				puts "Please enter a number"
			end
		end
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

	def showInventory
		x = 0
		@inventory[0].each do |slot|
			x += 1
		puts "slot #{x} #{slot.name}, you have #{inventory[1][x-1]} of these"
		end
	end

	def gather(direction)
		case direction
		when "forward"
			block = @world[(@position[0])][@position[1]+1]
			@world[(@position[0])][@position[1]+1] = EmptyBlock.new
		when "backward"
			block = @world[(@position[0])][@position[1]-1]
			@world[(@position[0])][@position[1]-1] = EmptyBlock.new
		when "right"
			block = @world[(@position[0]+1)][@position[1]]
			@world[(@position[0]+1)][@position[1]] = EmptyBlock.new
		when "left"
			block = @world[(@position[0]-1)][@position[1]]
			@world[(@position[0]-1)][@position[1]] = EmptyBlock.new
		else
			puts "Not an acceptable direction"
		end
		return block = block.mine
	end
end