# yaml for saving objects to a file
require "yaml" 
# colorize for coloring text
require 'colorize'
#To Do:
# Enums???

# Setup enums
# direction_options = Direction.new

# # Input name + check if there is a save file
# puts "What is your name?"
# protag = Player.new(gets.chomp)
# if File.exist?("saves/#{protag.name.strip}.yml")
# 	puts "Welcome back #{protag.name}!"
# 	protag = YAML.load(File.read("saves/#{protag.name.strip}.yml"))
# else
# 	protag.inventory = [Array.new(10, EmptyBlock.new), Array.new(10, 0)]
# 	protag.generateWorld
# 	puts "Find 5 diamonds and craft a portal to escape!"
# 	puts "If you are ever unsure what to do type 'help' for more information.\n\n"
# end

# game start
loop do 
	print "Typ your command: "
    input = gets.chomp.downcase.strip
    if input == "quit" || input == "stop" || input == "exit"
    	break  	
    elsif input == "help"
    	 puts "\nList of Commmands: quit, .\n"
    =
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
end