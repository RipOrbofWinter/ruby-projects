require_relative "Block.rb"

class EmptyBlock < Block
	def initialize()
		@name = "Air"
		@fortune = 0
	end

	def mine
	end
end
	