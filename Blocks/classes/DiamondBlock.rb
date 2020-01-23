require_relative "Block.rb"

class DiamondBlock < Block
	def initialize()
		@name = "DiamondOre"
		@harvest = "Diamond"
		@fortune = rand(1..3)
	end
	def scout
		tmp = self.name[0..2] + " "
		return tmp.colorize(:light_cyan)
	end
end
	