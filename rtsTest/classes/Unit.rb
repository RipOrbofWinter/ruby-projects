class Unit
	attr_accessor :attackDamage, :attackSpeed, :health, :shield, :healthArmor, :shieldArmor
	attr_reader :name, :attrubutes, :cost,
	def attack(target)
		puts "#{self.name} attacked unit #{target.name} for a total of #{self.calculateDamage} damage."
	end
	def calculateDamage(target)
		if target.shield <= 0 do
			target.health - (self.attackDamage - defense)
		elsif target.shield > 
			
		
	end
	def showSimpleStats
		puts self.name		
		puts "Shield: #{self.shield}"		
		puts "Health: #{self.health}"	
	end
	def showAdvancedStats
		puts self.name
		puts "Defensive values: "		
		puts "Health: #{self.health} Shield: #{self.shield}"		
		puts "Armor: #{self.health} Shield armor: #{self.shield}"		
		
		puts "Offensive values:"
		puts "Attack damage: #{self.attackDamage}"
		puts self.health	
		puts self.health	
		puts self.health	
	end
end
	