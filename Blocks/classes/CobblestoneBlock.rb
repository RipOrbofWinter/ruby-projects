require_relative "Block.rb"

class CobblestoneBlock < Block
	def initialize()
		@name = "Cobblestone"
		@harvest = @name
		@fortune = 1
	end

	def repair
		puts "You repaired the CobblestoneBlock into a StoneBlock!"
	return "Stone"
	end
end
	