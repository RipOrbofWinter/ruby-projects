## Loading gems/libraries

# colors for showing colored text
require 'colorize'
#generate uuid for unit id's
require 'securerandom'

## Loading Classes
require_relative 'classes/Zealot'
require_relative 'classes/Zergling'

## Create objects
@redUnits = [Zealot.new, Zealot.new]
@blueUnits = [Zergling.new, Zergling.new]

## Define functions
def removeUnit(defeatedUnit)
	if defeatedUnit.name == "Zealot"
		@redUnits.delete_if {|unit| unit.uuid == defeatedUnit.uuid}
	elsif defeatedUnit.name == "Zergling"
		@blueUnits.delete_if {|unit| unit.uuid == defeatedUnit.uuid}
	end
end

## Program start
puts "#{@redUnits[0].name}: #{@redUnits[0].uuid}"
puts "#{@blueUnits[0].name}: #{@blueUnits[0].uuid}"

# Requires team recognition/search by uuid
def testAttack(attackerId, defenderId)
	if @redUnits[attackerId].attack(@blueUnits[defenderId])
		removeUnit(@blueUnits[defenderId])
		puts
	else
	end
end
testAttack(0, 0)
testAttack(0, 0)
testAttack(0, 0)
testAttack(0, 0)
