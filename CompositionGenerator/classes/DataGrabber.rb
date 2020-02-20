class DataGrabber
	def initialize
		@key = "RGAPI-39cf7945-abda-4e81-b929-9c95e44d0ab0"
	end

	def getMatch(matchId)
		url = "https://euw1.api.riotgames.com/lol/match/v4/matches/#{matchId}"
		headers = {
		 'X-Riot-Token': "#{@key}"
		}

		response = HTTParty.get(url, headers: headers)
		my_hash = JSON.parse(response.body)
		if my_hash["status"] != nil
			puts "\nError code #{my_hash["status"]["status_code"]}:"
			puts my_hash["status"]["message"]
			my_hash = ""
		end

		if my_hash != ""
            blueTeam = Array.new()
            redTeam = Array.new()
            winner = ""
            i = 0
            while i < 10
                if i < 5
                    blueTeam.push(my_hash["participants"][i]["championId"])
                elsif i >= 5 && i < 10
                    redTeam.push(my_hash["participants"][i]["championId"])
                end
                i+=1
            end
            if my_hash["teams"][0]["win"] == "Win"
                winner = "blue"
            elsif my_hash["teams"][1]["win"] == "Win"
                winner = "red"
            else
                puts "No winner found; wtf Rito games"
            end
            game = Match.new(my_hash["gameId"], blueTeam, redTeam, winner) 
            return game
        else
            puts "\nAdding match aborted"
        end
	end

    def getManyMatch()
        matches =*(4416811773..4416811793)
        matches.each{ |match| 
            getMatch(match)
        }
    end
end