# yaml for saving objects to a file
require "yaml" 
# colorize for coloring text
require 'colorize'
# load player class
require_relative "classes/Player.rb"
# load all blocks
require_relative "classes/DirtBlock.rb"
require_relative "classes/StoneBlock.rb"
require_relative "classes/CobblestoneBlock.rb"
require_relative "classes/DiamondBlock.rb"
require_relative "classes/EmptyBlock.rb"
# load all items
require_relative "classes/Diamond.rb"
# load all enums
require_relative "classes/Direction"

#To Do:
# Enums???

# Setup enums
direction_options = Direction.new
# Input name + check if there is a save file
puts "What is your name?"
protag = Player.new(gets.chomp)
if File.exist?("saves/#{protag.name.strip}.yml")
	puts "Welcome back #{protag.name}!"
	protag = YAML.load(File.read("saves/#{protag.name.strip}.yml"))
else
	protag.inventory = [Array.new(10, EmptyBlock.new), Array.new(10, 0)]
	protag.generateWorld
	puts "Find 5 diamonds and craft a portal to escape!"
	puts "If you are ever unsure what to do type 'help' for more information.\n\n"
end

# game start
loop do 
	print "Typ your command: "
    input = gets.chomp.downcase.strip
    if input == "quit" || input == "stop" || input == "exit"
    	break  	
    elsif input == "help"
    	 puts "\nList of Commmands: quit, look, scout, move, inventory, gather, craft.\n"
    elsif input == "look"
    	protag.look
    elsif input == "scout"
    	protag.scout
	elsif input == "move"
		loop do
			puts "Which direction do you want to move in?"
			direction = gets.chomp.downcase.strip
			if direction_options.find{|item| item == direction}
			# if direction_options.include? direction
				puts "\nHow far do you want to move?"
				puts "You have enough stanima to move up to 3 spaces at a time."
				distance = gets.chomp.to_i
				distance.to_i
					if distance > 0 and distance <= 3
						if protag.move(direction, distance) == true
							break
						end
					else
						puts "You cannot move #{distance} blocks!"
					end
			else
				puts "Not an acceptable direction, try help for list of items you can create. Or, type 'quit' to exit\n"
			end			

		end
	elsif input == "inventory"
		protag.showInventory
	elsif input == "gather"
		loop do
			puts "Which direction do you want to gather from?"
			direction = gets.chomp.downcase.strip
			gathered = protag.gather(direction)
			if  gathered == true
				puts ""
				break
			end
			# puts gathered.respond_to?(:harvest)
			if gathered.respond_to?(:harvest)
				case gathered.harvest
				when "Dirt"
					protag.inventory[0][0] = DirtBlock.new
					protag.inventory[1][0] += gathered.fortune
				when "Cobblestone"
					protag.inventory[0][1] = CobblestoneBlock.new
					protag.inventory[1][1] += gathered.fortune
				when "Stone"
					protag.inventory[0][2] = StoneBlock.new
					protag.inventory[1][2] += gathered.fortune
				when "Diamond"
					protag.inventory[0][3] = Diamond.new
					protag.inventory[1][3] += gathered.fortune
				when "Air"
					# return nothing.
				else
					puts "Error 404: block not found."
				end
				break
			end
		end
	elsif input == "craft"	
		puts "Entering the crafting menu..."
		protag.showInventory
		loop do
			print "Choose which item you want to create: "
			if protag.craft(gets.chomp.downcase.strip) == true
				puts ""
				break
			end
		end
	#Dev functions
	elsif input == "generate"
		if protag.name == "Maurits"
			protag.generateWorld
			protag.inventory = Array.new(10, EmptyBlock.new)
		end
	elsif input == "superscout"
		if protag.name == "Maurits"
			protag.fullScout
		end
    else
    	puts "Not an acceptable command, try 'help' for the list of commands."
    end
end

# game end
loop do
	puts "Save your progress?"
	tmp = gets.chomp.downcase.strip
	if tmp == "y" || tmp == "yes"
		puts "\nSaving Data..."
		File.open("saves/#{protag.name.strip}.yml", "w") { |file| file.write(protag.to_yaml) }
		puts "Saved!!\n"
		break
	elsif tmp == "n" || tmp == "no"
		puts "\nData not Saved"
		break
	else
		puts "Please anwser with either yes(y) or no(n)"
	end
end