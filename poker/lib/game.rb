require_relative 'player'
class Game
    
   attr_accessor :deck, :pot
   attr_reader :pot
   
   def initialize(*players)
       @players = players
       @deck = Deck.full_deck
       @pot = 0
       start_game
   end
   
   def start_game
       until
       
   end
   
   def player_bankrupt?
      
   end
end