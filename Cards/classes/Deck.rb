class Deck
	def initialize()
		@deck =*(2..14)
		@cardcount = @deck.length
	end 
	def Deck
		@deck
	end
	def Count
		@cardcount
	end
	def DrawCard
		@deck.first
	end
	def Shuffle(times)
		x = 0
		while x <= times do
			#used cards get selected and it go bad
			i = [rand(0..@cardcount), rand(0..@cardcount)]
			if i[0] != i[1]
			 @deck[i[0]], @deck[i[1]] = @deck[i[1]], @deck[i[0]]
			x +=1
			end
		end
	end
	def RemoveCard
		@deck.shift
		@cardcount = @deck.length
	end
end