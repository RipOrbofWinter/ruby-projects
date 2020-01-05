class Auto	

	def initialize(kenteken, brandstof)
     @kmStand = 1
     @kenteken = kenteken
     @brandstof = brandstof
     @dagWaarde = (500000/@kmStand) * @brandstof
	end	

	def NewKmStand(value)
		@KmStand = value
	end

	#Get functies
    def KmStand()
   		puts @kmStand
   	end
    def Kenteken()
   		puts @kenteken
   	end
	def Brandstof()
		puts @brandstof   		
	end
	def DagWaarde()
		@dagWaarde = (500000/@kmStand) * @brandstof
		puts @dagWaarde   		
	end


	#Set functies
	def RijdKilometers(value)
		if value > 0 
			@kmStand += value
		end
	end
end