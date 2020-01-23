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

puts color_test.colorize(:light_cyan) + color_test.colorize(:red)
puts String.colors


