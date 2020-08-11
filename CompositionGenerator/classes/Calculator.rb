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
        return nil
	end

	def countTotalGames
		matchList = YAML.load(File.read("saves/MatchHistory.yml"))
		puts matchList.history.count
	end
	
	def winrate(matches, wins)
		percentage = (wins.to_f / matches)*100
		return percentage.to_i
	end

# 	get 1 champion + matchup champions(array)	
	def getMatchup(userChampion, matchupChampions)

		userChampion = to_chI(userChampion)
		matchupChampions[0] = to_chI(matchupChampions[0])
		matches = 0
		wins = 0
		puts "Searching for matches..."
		matchList = YAML.load(File.read("saves/MatchHistory.yml"))


		matchList.history.each do |i|
			counter = 0
			while counter <=5
				if i.blueTeam[counter] == userChampion
					5.times do |i2|
						if i.redTeam[i2+1] == matchupChampions[0]
							matches +=1
							if i.winner == "blue"
								wins +=1
							end
						end
					end
				elsif i.redTeam[counter] == userChampion
					5.times do |i2|
						if i.blueTeam[i2+1] == matchupChampions[0]
							matches +=1
							if i.winner == "red"
								wins +=1
							end
						end
					end
				end
				counter +=1
			end
		end
		matches = [matches, winrate(matches, wins)]
		puts "#{to_chN(userChampion)} has out of #{matches[0]} matches against #{to_chN(matchupChampions[0])}, a winrate of #{matches[1]}%."
	end

	def getWinsByChampion(championId)
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

		return [matches, winrate(matches, wins)]
	end

	def championWinrate(championName)
		championId = to_chI(championName)
		matches = getWinsByChampion(championId)
		if championId != nil
			puts "#{championName} has out of #{matches[0]} matches, a winrate of #{matches[1]}%."
			return matches
		else
			puts "Unknown championName" 
		end
	end
end