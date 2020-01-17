require 'colorize'

str = "┌───────────────────┐\n"\
      "│	  	    │\n"\
 	  "│  ┌─────────────┐  │\n"\
	  "│  │             │  │\n"\
	  "│  │     ───     │  │\n"\
	  "│  │             │  │\n"\
	  "│  └─────────────┘  │\n"\
	  "│		    │\n"\
 	  "└───────────────────┘"
 	  puts str

color_test = "test "

puts color_test.colorize(:light_blue) + color_test.colorize(:brown)
puts String.colors


