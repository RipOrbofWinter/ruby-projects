# Loading gems/libraries
# yaml for saving objects to a file
require "yaml" 
# http requests
require 'httparty'
# json parsing
require 'json'
# for converting timestamp to date
require 'date'
# Testing
require "test/unit/assertions"
include Test::Unit::Assertions
# Loading Classes
require_relative 'classes/DataGrabber'
require_relative 'classes/MatchList'
require_relative 'classes/Calculator'
require_relative 'classes/Match'
# Enumerables
require_relative 'classes/ChampionList'
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


# Testing functions:
include Test::Unit::Assertions
# Load champion 1 for tests
testChampion = champion_options.find{ |champion|
	champion[0] = 1
}
# Testing the enum
assert testChampion[0].integer?, "champion_options.find does not return an integer"
assert_equal testChampion[1], "Annie", "Champion id nr 1 is not linked to the correct champion"
# Testing the winrate calculating function
ezWinrate = calculator.championWinrate(testChampion[1])
assert_not_nil(ezWinrate, "championWinrate(Annie) returned nil")
assert_not_same(ezWinrate[0], 0, "championWinrate(Annie) returns 0 played matches")

puts "All tests passed succesfully"
