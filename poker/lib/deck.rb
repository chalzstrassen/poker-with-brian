require "card"

class Deck

  def self.full_deck
    cards = []
    Card::SUITS.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    Deck.new(cards)
  end

  attr_accessor :cards
  
  def initialize(cards = [])
    @cards = cards
  end

  def shuffle!
    @cards.shuffle!
  end

  def count
    @cards.count
  end

  def take
    return [] if @cards.empty?
    return [@cards.shift]
  end

  def put_card(card)
    @cards << card
  end

  def draw
    hand = []
    5.times { hand << take }
    hand.flatten
  end
end
