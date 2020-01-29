# yaml for saving objects to a file
require "yaml" 
# colorize for coloring text
require 'colorize'
# http requests
require 'httparty'
# json parsing
require 'json'


# Objects
require_relative 'classes/DataGrabber'
require_relative 'classes/Calculator'
require_relative 'classes/Match'
# Enumerables
require_relative 'classes/ChampionList'

# Setup enums
champion_options = ChampionList.new
champion_options = champion_options.sort

puts "Welcome to the winrate calculator!"
if(File.exist?("saves/MatchHistory.yml"))
    puts "\nLoading Data..."
    history = YAML.load(File.read("saves/MatchHistory.yml"))
    puts "Done!\n"
else
    puts "Creating new MatchHistory file..."
    history = DataGrabber.new
    puts "Done!\n"
end

# Create objects
calculator = Calculator.new

# Program start
loop do 
	print "Typ your command: "
    input = gets.chomp.downcase.strip
    if input == "quit" || input == "stop" || input == "exit"
    	break  	
    elsif input == "get"

    elsif input == "add"
        apiHash = history.getMatch
        blueTeam = Array.new()
        redTeam = Array.new()
        winner = ""
        i = 0
        while i < 10
            if i < 5
                blueTeam.push(apiHash["participants"][i]["championId"])
            elsif i >= 5 && i < 10
                redTeam.push(apiHash["participants"][i]["championId"])
            end
            i+=1
        end
        if apiHash["teams"][0]["win"] == "Win"
            winner = "blue"
        elsif apiHash["teams"][1]["win"] == "Win"
            winner = "red"
        else
            puts "wtf Rito games"
        end
        game = Match.new(blueTeam, redTeam, winner) 
        p history.matchList = game
    elsif input == "history"
        p history.matchList
    elsif input == "save"
        File.open("saves/MatchHistory.yml", "w") { |file| file.write(history.to_yaml) }
        puts "File saved"
    elsif input == "test"
        p ""
    elsif input == "convert"
        p champion_options[rand(0..147)][0]
    elsif input == "load"
        history = YAML.load(File.read("saves/MatchHistory.yml"))
    elsif input == "help"
    	 puts "\nList of Commmands: quit, input, add, test, save, load.\n"
    else
    	puts "Not an acceptable command, try 'help' for the list of commands."
    end
end


# game end
# loop do
# 	puts "Save your progress?"
# 	tmp = gets.chomp.downcase.strip
# 	if tmp == "y" || tmp == "yes"
# 		puts "\nSaving Data..."
# 		File.open("saves/#{protag.name.strip}.yml", "w") { |file| file.write(protag.to_yaml) }
# 		puts "Saved!!\n"
# 		break
# 	elsif tmp == "n" || tmp == "no"
# 		puts "\nData not Saved"
# 		break
# 	else
# 		puts "Please anwser with either yes(y) or no(n)"
# 	end
# end