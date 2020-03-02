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

	def count(championName, history)
		championId = to_chI(championName)
		matches = 0
		wins = 0
		@history.each do |i|
			counter = 0
			while counter <=5
				if i.blueTeam[counter] == championId
					matches +=1
					if 1.winner == blue
						wins +=1
					end
				end
				if i.redTeam[counter] == championId
					matches +=1
					if 1.winner == red
						wins +=1
					end
				end
				counter +=1
			end
		end
		return "This champion played #{matches} of which they won #{wins}"
	end
end