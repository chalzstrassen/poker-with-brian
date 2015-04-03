class Card
  SUITS = [:hearts, :spades, :diamonds, :clubs]
  VALUE = {
    :two => 1,
    :three =>2,
    :four =>3,
    :five => 4,
    :six => 5,
    :seven => 6,
    :eight => 7,
    :nine => 8,
    :ten => 9,
    :jack => 10,
    :queen => 11,
    :king => 12,
    :ace => 13
    }

  def self.values
    VALUE.keys
  end
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def numerical
    VALUE[@value]
  end
  
end
