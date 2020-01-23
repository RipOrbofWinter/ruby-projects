class Direction
	include Enumerable

	def each
		yield "forward"
		yield "backward"
		yield "right"
		yield "left"
	end
end
	