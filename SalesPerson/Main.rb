require_relative "Classes/Calculator.rb"

calculator = Calculator.new

loopCounter = 30
fieldSize = 1000
graph = Array.new(fieldSize) { Array.new(fieldSize, 0)  }
cities = Array.new(loopCounter) { [0, 0] }
cityTravelTime = Array.new(loopCounter) { Array.new(loopCounter-1, 0) }

times = 0 
while times < loopCounter do
	randomX = rand(fieldSize)
	randomY = rand(fieldSize)
	if graph[randomX][randomY] != 1
		graph[randomX][randomY] = 1
		cities[times][0] = randomX
		cities[times][1] = randomY
		times +=1
	elsif graph[randomX][randomY] == 1
		times -=1
	end
end

puts "Calculating nearest city for city 0: "
puts 

times = 1
while times < cities.length do
	distanceX = (cities[0][0] - cities[times][0])
	distanceY = (cities[0][1] - cities[times][1])
	distanceX = calculator.toPositive(distanceX) if calculator.isNegative(distanceX) == 1
	distanceY = calculator.toPositive(distanceY) if calculator.isNegative(distanceY) == 1
	cityTravelTime[0][times-1] = distanceX + distanceY

	print "City 0 to City: #{times} "
	print "Distance x: #{distanceX} "
	print "Distance y: #{distanceY} "
	print "Total Distance: #{distanceX + distanceY}"
		puts ""
	times += 1
end

puts "The closest city to city 0 is city #{cityTravelTime[0].index(cityTravelTime[0].min)} with a distance of: #{cityTravelTime[0].min}"

print cities
puts calculator.isNegative(-400)

calculator.toPositive(-15)