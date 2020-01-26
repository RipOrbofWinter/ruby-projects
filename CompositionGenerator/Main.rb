# yaml for saving objects to a file
require "yaml" 
# colorize for coloring text
require 'colorize'
# Objects
require_relative 'classes/DataGrabber'
require_relative 'classes/Calculator'
require_relative 'classes/ChampionList'

# Setup enums
champion_options = ChampionList.new

puts "Welcome to the winrate calculator!"

# puts "\nLoading Data..."
#     YAML.load(File.read("saves/Annie.yml"))
# puts "Done!\n"

# Create objects
calculator = Calculator.new
data = DataGrabber.new
championId = 1


# champion = Champion.new(Annie)
# game start
loop do 
	print "Typ your command: "
    input = gets.chomp.downcase.strip
    if input == "quit" || input == "stop" || input == "exit"
    	break  	
    elsif input == "input"
        # File.open("saves/Annie.yml", "w") { |file| file.write(champion.to_yaml) }
        puts "File open"
    elsif input == "load"
        champion_options.each do |item| puts "#{item[1]}"
        puts champion_options.count

        # if champion = champion_options.find{ |item| item[0] == championId}
            # puts champion[1]
        end
    elsif input == "help"
    	 puts "\nList of Commmands: quit, input, load.\n"
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