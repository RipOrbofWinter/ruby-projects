require_relative "classes/Player.rb"
require_relative "classes/DirtBlock.rb"
require_relative "classes/StoneBlock.rb"
require_relative "classes/CobblestoneBlock.rb"
require_relative "classes/EmptyBlock.rb"

#To Do:
# Make actual gameplay like gather or build(?)
# Make 3d
# Test if world is round since ruby array -1 = last array index

puts "What is your name?"
protag = Player.new(gets)

protag.inventory = Array.new(10, EmptyBlock.new())
world = [[DirtBlock.new(), DirtBlock.new()], [StoneBlock.new(), DirtBlock.new()]]


# game start
print "Typ your command: "
loop do 
    input = gets.chomp

    if input == "quit"
    	break
    elsif input == "help"
    	 puts "List of Commmands: quit, look, move, inventory, gather"
    elsif input == "look"
    	protag.look
	elsif input == "move"
		puts "Which direction do you want to move in?"
		protag.move(gets.chomp, world)
	elsif input == "inventory"
		protag.showInventory
	elsif input == "gather"
    	
    else
    	puts "Not an acceptable command, try 'help' for the list of commands"
    end
end

# game end
puts "Ending Results: \n\n"

puts protag.name
protag.look
protag.showInventory