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

	def winrate(matches, wins)
		percentage = (wins.to_f / matches)*100
		return percentage.to_i
	end

	def searchChampionGames(championId)
		matches = 0
		wins = 0
		puts "Searching for matches..."
		matchList = YAML.load(File.read("saves/MatchHistory.yml"))
		matchList.history.each do |i|
			counter = 0
			while counter <=5
				if i.blueTeam[counter] == championId
					matches +=1
					if i.winner == "blue"
						wins +=1
					end
				elsif i.redTeam[counter] == championId
					matches +=1
					if i.winner == "red"
						wins +=1
					end
				end
				counter +=1
			end
		end

		return winrate(matches, wins)
	end

	def count(championName)
		championId = to_chI(championName)
		p "#{championName} has a winrate of #{searchChampionGames(championId)}%."
	end
end