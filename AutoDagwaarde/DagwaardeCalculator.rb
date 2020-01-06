require_relative "classes/Auto"

	module BrandstofSoort
		Benzine = 100
		Diesel = 150
		LPG = 90
		Elektrisch = 130
	end


auto1 = Auto.new("TE-ST-01", BrandstofSoort::Benzine)
auto2 = Auto.new("TE-ST-02", BrandstofSoort::LPG)
auto3 = Auto.new("TE-ST-03", BrandstofSoort::Elektrisch)
auto4 = Auto.new("TE-ST-04", BrandstofSoort::Benzine)


puts "Specs of Car1: "
tmp = auto1.KmStand
tmp = auto1.Kenteken
tmp = auto1.Brandstof
tmp = auto1.DagWaarde
puts "Car1 drives 2 km."
tmp = auto1.RijdKilometers(2)
tmp = auto1.KmStand
tmp = auto1.DagWaarde
