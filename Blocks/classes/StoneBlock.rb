require_relative "Block.rb"

class StoneBlock < Block
	def initialize()
		@name = "Stone"
		@harvest = "Cobblestone"
		@fortune = 1
	end
	def scout
		tmp = self.name[0..2] + " "
		return tmp.colorize(:light_black)
	end
end
	