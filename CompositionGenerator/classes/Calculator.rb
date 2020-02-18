class Calculator
	def initialize(championEnum)
		@champion_options = championEnum
	end

	def to_chN(championId)
        @champion_options.each { |n| 
            if n[0] == championId
                return n[1]
            end
        }
	end
	def to_chI(championName)
        @champion_options.each { |n| 
            if n[1] == championName
                return n[0]
            end
        }
	end

	def count(championName)
		
	end
end