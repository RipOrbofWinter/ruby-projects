require_relative "classes/DirtBlock.rb"
require_relative "classes/StoneBlock.rb"
require_relative "classes/CobblestoneBlock.rb"
require_relative "classes/EmptyBlock.rb"

inventory = Array.new(10, "Air")
world = [["Dirt", "Dirt"], ["Stone", "Dirt"]]


	def gather(gatherd_block)
		case gatherd_block
			when "Dirt"
				world[0][0] = "Air"
				inventory[0] = "Dirt"
				exit
			when "Stone"
				world[0][0] = "Air"
				inventory[0] = "Stone"
				exit
			when "Cobblestone"
				world[0][0] = "Air"
				inventory[0] = "Cobblestone"
				exit
			else
				puts gatherd_block
		end
	end

	def blockify(block)
		case block
			when "Dirt"
				return DirtBlock.new()
				exit
			when "Stone"
				return StoneBlock.new()
				exit
			when "Cobblestone"
				return CobbleStoneBlock.new()
				exit
			else
				puts block
		end
	end

block1 = DirtBlock.new
world[0][0] = "Air"

block1.look
block1.mine

# puts "My inventory holds: " + inventory[0].name