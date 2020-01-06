require_relative "Block.rb"

class DirtBlock	< Block
	def initialize()
		@name = "Dirt"
		@harvest = @name
		@fortune = [1]
	end
end
	