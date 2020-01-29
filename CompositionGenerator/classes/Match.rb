class Match
	attr_reader :blueTeam, :redTeam, :winner

	def initialize(blue, red, win)
		@blueTeam = blue
		@redTeam = red
		@winner = win
	end
end