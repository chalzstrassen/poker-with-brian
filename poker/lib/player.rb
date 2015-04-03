require_relative 'hand'

class Player

  attr_accessor :hand, :stack

  def initialize
    @hand = Hand.new
    @stack = 10000
  end

  def discard(arr_pos)
    discard_pile = []
    arr_pos.each do |i|
      discard_pile << @hand[i]
    end
    @hand.hand_size -= discard_pile

    discard_pile
  end

  def fold
    discard([0,1,2,3,4])
  end

  def call(bet)
    if bet > @stack
      call(@stack)
    else
      @stack -= bet
      return bet
    end
  end

  def raise(bet)
    call(bet*2)
  end
end
