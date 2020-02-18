class Match
	attr_reader :matchId, :blueTeam, :redTeam, :winner

	def initialize(id, blue, red, win)
		@matchId = id
		@blueTeam = blue
		@redTeam = red
		@winner = win
	end
end