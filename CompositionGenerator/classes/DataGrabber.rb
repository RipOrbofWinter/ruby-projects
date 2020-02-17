class DataGrabber
	attr_accessor :matchList
	def initialize
		@matchList = Array.new()
		@key = "RGAPI-352b2c10-33de-4cef-8158-7b5122520ba2"
	end

	def printMatchlist
		x = 1
		@matchList.each do |i|
			multiline_string = """
match #{x}:
Blue side champions are: #{i.blueTeam}.
VS
Red side champions are: #{i.redTeam}.
The winner was team #{i.winner}\n\n
"""
			puts multiline_string
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