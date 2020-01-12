require_relative "classes/Card"
require_relative "classes/Deck"

Shoes.app height: 800, width: 1200 do
	deck = Deck.new
	card = deck.Shuffle(20)
	card = deck.DrawCard()
	card = Card.new(card, 'heart')

	@draw = button "draw"
	@shuffle= button "shuffle"
	@newDeck= button "reset deck"
	@cardImage = stack { image "images/card_back.svg.png", height: 300, width: 200 }
	@cardImage2 = stack { image "images/card_back.svg.png", top: -300, left: 205, height: 300, width: 200 }
	@deckSneakPeak = stack { para "current deck"}
	@deckSize= stack { para "current deck size"}


	#functions
	@draw.click do
		if deck.Deck.length > 0# not tested/finished
			@cardImage.clear { image card.Open, height:  300, width: 200 }
			@points = para card.Value
			@deckSneakPeak.clear { para deck.Deck }
			@deckSize.clear { para deck.Count}
			card = deck.RemoveCard
			card = deck.DrawCard
			card = Card.new(card, 'heart')
		end
	end
	@shuffle.click do
		if deck.Deck.length >= 2
			card = deck.Shuffle(20)
			card = deck.DrawCard()
			card = Card.new(card, 'heart')
			@deckSneakPeak.clear { para deck.Deck }
		end
	end
	@newDeck.click do
		deck = Deck.new
		card = deck.Shuffle(20)
		card = deck.DrawCard()
		card = Card.new(card, 'heart')
		@deckSneakPeak.clear { para deck.Deck }
	end	
 end