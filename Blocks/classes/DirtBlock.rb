require_relative "Block.rb"

class DirtBlock	< Block
	def initialize()
		@name = "Dirt"
		@harvest = @name
		@fortune = 1
	end
	def scout
		tmp = self.name[0..2] + " "
		return tmp.colorize(:green)
	end
end
	