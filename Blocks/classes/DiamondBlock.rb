require_relative "Block.rb"

class DiamondBlock < Block
	def initialize()
		@name = "DiamondOre"
		@harvest = "Diamond"
		@fortune = rand(1..3)
	end
end
	