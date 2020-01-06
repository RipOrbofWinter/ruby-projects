require_relative "Block.rb"

class StoneBlock < Block
	def initialize()
		@name = "Stone"
		@harvest = "Cobblestone"
		@fortune = [1]
	end

end
	