require "yaml"

require_relative "classes/Player.rb"
require_relative "classes/DirtBlock.rb"
require_relative "classes/StoneBlock.rb"
require_relative "classes/CobblestoneBlock.rb"
require_relative "classes/EmptyBlock.rb"

#To Do:
# Make actual gameplay like puzzle game?
# Generate World function

#get user name and check if they exist in the save file
puts "What is your name?"
protag = Player.new(gets)
if File.exist?("saves/#{protag.name}.yml")
	puts "File exists"
	protag = YAML.load(File.read("saves/#{protag.name}.yml"))
else
	File.open("saves/#{protag.name}.yml", "w") { |file| file.write(protag.to_yaml) }
	data_from_file = File.read("saves/#{protag.name}.yml")
	puts data_from_file
end

protag.inventory = Array.new(10, EmptyBlock.new)
world = [[DirtBlock.new, DirtBlock.new, DirtBlock.new], [StoneBlock.new, DirtBlock.new, StoneBlock.new], [CobblestoneBlock.new, CobblestoneBlock.new, StoneBlock.new]]


# game start
print "Typ your command: "
loop do 
    input = gets.chomp

    if input == "quit"
    	break
    elsif input == "help"
    	 puts "List of Commmands: quit, look, scout, move, inventory, gather."
    elsif input == "look"
    	protag.look
    elsif input == "scout"
    	protag.scout(world)
	elsif input == "move"
		puts "Which direction do you want to move in?"
		protag.move(gets.chomp, world)
	elsif input == "inventory"
		protag.showInventory
	elsif input == "gather"
		puts "Which direction do you want to gather from?"
		gathered = protag.gather((direction = gets.chomp), world)
		case gathered
		when "Dirt"
			protag.inventory[protag.activeInventory] = DirtBlock.new
		when "Cobblestone"
			protag.inventory[protag.activeInventory] = CobblestoneBlock.new
		when "Stone"
			protag.inventory[protag.activeInventory] = StoneBlock.new
		else
			puts "Error 404: block not found."
		end
    else
    	puts "Not an acceptable command, try 'help' for the list of commands."
    end
end

# game end
puts "Save your progress?"
tmp = gets.chomp.downcase
if tmp == "y"
	puts "\nSaving Data..."
	File.open("saves/#{protag.name}.yml", "w") { |file| file.write(protag.to_yaml) }
	puts "Saved!!\n"
else
	puts "\nData not Saved"
end
puts "Ending Results:\n\n"

puts protag.name
protag.look
protag.showInventory