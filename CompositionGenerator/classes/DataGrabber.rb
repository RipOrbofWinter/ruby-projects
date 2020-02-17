class DataGrabber
	attr_accessor :matchList
	def initialize
		@matchList = Array.new()
		@key = "RGAPI-352b2c10-33de-4cef-8158-7b5122520ba2"
	end

	def to_ch(champion_options, championId)
        champion_options.each { |n| 
            if n[0] == championId
                return n[1]
            end
        }
	end

	def printMatchlist(champion_options)
		matchId = 1
		@matchList.each do |i|
		# convert ids to name
		counter = 1;
		redChampions = ""
		blueChampions = ""
			while counter <=10
				if counter <=5
					blueChampions += "#{to_ch(champion_options, i.blueTeam[counter-1])}, "
				else
					redChampions += "#{to_ch(champion_options, i.redTeam[counter-6])}, "
				end
				counter +=1
			end

			multiline_string = """
match #{matchId}:
Blue side champions are: #{blueChampions}.
VS
Red side champions are: #{redChampions}.
The winner was team #{i.winner}\n\n
"""
			puts multiline_string
			matchId+=1
		end
	end

	def matchList=(game)
		@matchList.push(game) 
	end

	def getMatch
		url = 'https://euw1.api.riotgames.com/lol/match/v4/matches/4387187881'
		headers = {
		 'X-Riot-Token': @key
		}

		response = HTTParty.get(url, headers: headers)
		my_hash = JSON.parse(response.body)
	end
end