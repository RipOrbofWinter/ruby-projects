require "yaml"

require_relative "classes/Player.rb"
# load all blocks
require_relative "classes/DirtBlock.rb"
require_relative "classes/StoneBlock.rb"
require_relative "classes/CobblestoneBlock.rb"
require_relative "classes/DiamondBlock.rb"
require_relative "classes/EmptyBlock.rb"
# load all items
require_relative "classes/Diamond.rb"


#To Do:
# Class diagram 
# Enums


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
	puts ""
end

# game start
loop do 
	print "Typ your command: "
    input = gets.chomp.downcase.strip

    if input == "quit"
    	break
    elsif input == "help"
    	 puts "List of Commmands: quit, look, scout, move, inventory, gather, craft."
    elsif input == "look"
    	protag.look
    elsif input == "scout"
    	protag.scout
	elsif input == "move"
		protag.move
	elsif input == "inventory"
		protag.showInventory
	elsif input == "gather"
		puts "Which direction do you want to gather from?"
		gathered = protag.gather((direction = gets.chomp.downcase.strip))
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
		else
			puts "Error 404: block not found."
		end
	elsif input == "craft"
		puts "Entering the crafting menu..."
		protag.craft
	#Dev functions
	elsif protag.name = "Maurits"
		if input == "generate"
			protag.generateWorld
			protag.inventory = Array.new(10, EmptyBlock.new)
		elsif input == "superscout"
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