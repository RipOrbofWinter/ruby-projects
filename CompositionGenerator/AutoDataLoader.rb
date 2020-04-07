# Loading gems/libraries
# yaml for saving objects to a file
require "yaml" 
# http requests
require 'httparty'
# json parsing
require 'json'
# timer facets
require 'facets/timer'

# Loading Classes
require_relative 'classes/DataGrabber'
require_relative 'classes/MatchList'
require_relative 'classes/Calculator'
require_relative 'classes/Match'
# Enumerables
require_relative 'classes/ChampionList'

# TO DO:
#  Search for champion Matches/games/played


# Setup enums
champion_options = ChampionList.new
champion_options = champion_options.sort

# load History file
if(File.exist?("saves/MatchHistory.yml"))
    puts "\nLoading Data..."
    matchList = YAML.load(File.read("saves/MatchHistory.yml"))
    puts "Done!\n"
else
    puts "Creating new MatchHistory object..."
    matchList = MatchList.new
    puts "Done!\n"
end

# Create objects
calculator = Calculator.new(champion_options)
dataLoader = DataGrabber.new


# games = dataLoader.getByLeague
x = 0
while x <= 40 do
	Timer.time do |timer|
		sleep 12 # every 15 seconds save 4 games
			games = dataLoader.getByLeague
		    games.each{ |game|
		    	puts matchList.history = game
		    }
		    File.open("saves/MatchHistory.yml", "w") { |file| file.write(matchList.to_yaml) }
		    puts "File saved"
			break	
		timer.stop
		x += 1
		p x
	end
end
