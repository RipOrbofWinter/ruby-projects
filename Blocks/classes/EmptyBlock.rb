require_relative "Block.rb"

class EmptyBlock < Block
	def initialize()
		@name = "Air"
		@harvest = @name
		@fortune = 0
	end

	def mine
		puts "You can't mine Air!"
	end
end
	