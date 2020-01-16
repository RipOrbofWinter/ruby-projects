require_relative "Block.rb"

class Diamond
	attr_reader :name 

	def initialize()
		@name = "Diamond"
	end
	def info
		puts "You feel the energy of your homeworld coming from the gem"
		puts "Perhaps you can use this to return?"
	end
end
	