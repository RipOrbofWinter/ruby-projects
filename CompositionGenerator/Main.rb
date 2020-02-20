# Loading gems/libraries
# yaml for saving objects to a file
require "yaml" 
# colorize for coloring text
require 'colorize'
# http requests
require 'httparty'
# json parsing
require 'json'

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

# Program start
# 
loop do 
	print "Typ your command: "
    input = gets.chomp.downcase.strip
    if input == "quit" || input == "stop" || input == "exit"
    	break  	
    elsif input == "get"
        print "Select a champion: "
        calculator.count(gets.chomp.capitalize.strip)
    elsif input == "add"
        print "Put in the gameId: "
        matchId = gets.chomp.strip
        game = dataLoader.getMatch(matchId)
        puts matchList.history = game
    elsif input == "history"
        matchList.printHistory(calculator, champion_options)
    elsif input == "save"
        File.open("saves/MatchHistory.yml", "w") { |file| file.write(matchList.to_yaml) }
        puts "File saved"
    elsif input == "test"

        # calculator.to_chN(champion_options, 18)
    elsif input == "help"
    	 puts "\nList of Commmands: quit, get, add, history, test, save, load.\n"
    else
    	puts "Not an acceptable command, try 'help' for the list of commands."
    end
end