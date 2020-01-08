require_relative "classes/Player.rb"
require_relative "classes/DirtBlock.rb"
require_relative "classes/StoneBlock.rb"
require_relative "classes/CobblestoneBlock.rb"
require_relative "classes/EmptyBlock.rb"

#To Do:
# Make actual gameplay like puzzle game?
# Test if world is round since ruby array -1 = last array index (update: is true!)
# Generate World function

puts "What is your name?"
protag = Player.new(gets)

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
puts "Ending Results: \n\n"

puts protag.name
protag.look
protag.showInventory