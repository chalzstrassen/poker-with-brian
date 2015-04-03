require_relative 'deck'

class Hand
  RANKING = [:high_card, :pair, :two_pair, :three_of_a_kind, :straight,
             :flush, :full_house, :four_of_a_kind, :straight_flush, :royal]

  attr_accessor :hand_size

  def initialize
    @hand_size = Array.new(5)
  end
end
