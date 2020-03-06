class DataGrabber
	def initialize
		@key = "RGAPI-8ea94ccc-4fea-428e-990e-a9f2aad7de6b"
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
                puts "No winner found; Rito games strikes again"
            end
            game = Match.new(my_hash["gameId"], blueTeam, redTeam, winner) 
            return game
        else
            puts "\nAdding match aborted"
        end
	end

    def getManyMatch()
    end

    def getByLeague()
        tiers = ["I", "II", "III", "IV"]
        games = Array.new()
        tiers.each{ |tier|
            # get random user from specified elo
            url = "https://euw1.api.riotgames.com/lol/league/v4/entries/RANKED_FLEX_SR/PLATINUM/#{tier}?page=#{rand(1..10)}"
            headers = { 'X-Riot-Token': "#{@key}" }
            response = HTTParty.get(url, headers: headers)
            my_hash = JSON.parse(response.body)
            my_hash = my_hash[rand(1..200)]["summonerId"]
            # get accountID for match history
            url = "https://euw1.api.riotgames.com/lol/summoner/v4/summoners/#{my_hash}"
            response = HTTParty.get(url, headers: headers)
            my_hash = JSON.parse(response.body)
            my_hash = my_hash["accountId"]
            # get a match with the acount id
            url = "https://euw1.api.riotgames.com/lol/match/v4/matchlists/by-account/#{my_hash}?queue=440"
            response = HTTParty.get(url, headers: headers)
            my_hash = JSON.parse(response.body)
            games.push(self.getMatch(my_hash["matches"][rand(1..20)]["gameId"]))
        }
        return games
    end
end