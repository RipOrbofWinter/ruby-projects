class DataGrabber
	attr_accessor :matchList
	def initialize
		@matchList = Array.new()
	end

	def matchList=(game)
		@matchList.push(game) 
	end

	def getMatch
		url = 'https://euw1.api.riotgames.com/lol/match/v4/matches/4387187881'
		headers = {
		 'X-Riot-Token': 'RGAPI-8178a383-5aaa-4d40-b191-52e200e828e9'
		}

		response = HTTParty.get(url, headers: headers)
		my_hash = JSON.parse(response.body)
	end
end