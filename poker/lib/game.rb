require_relative 'player'
class Game
    
   attr_accessor :deck
   
   def initialize(*players)
       @players = players
       @dealer = dealer
       @deck = Deck.full_deck
       @pot = 0
       start_game
   end
   
   def start_game
       @players.each do |player|
           
       end
       
   end
   
end