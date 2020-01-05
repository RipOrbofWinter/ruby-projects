class Card
   @closed = true;
   @link = ''
   def initialize(cardNumber, cardType)
      case cardNumber 
      when 2..10
         @value = cardNumber
      when 11
         @value = 'ace'
      when 12
         @value = 'jack'
      when 13
         @value = 'queen'
      when 14
         @value = 'king'
      else
         @value = 'back'
      end
      @type = cardType;
   end

   # functions
   def Open()
      @closed = false
      if @value != 'back'
         return 'images/card_' + @type + '_' + @value.to_s + '.svg.png'
      else
         return 'images/card_' + @value + '.svg.png'
      end
   end
   def Value() 
      case @value 
      when 2..10
         return @value.to_i
      when 'ace'
         return 11
      when 'jack'
         return 'jack'
      when 'queen'
         return 'queen'
      when 'king'
         return 'king'
      else
         return 'unkown card'
      end
   end
   def Close()
      @closed = true
      return 'images/card_back.svg.png'
   end
end