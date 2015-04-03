require_relative 'deck'

class Hand
  RANKING = [:high_card, :pair, :two_pair, :three_of_a_kind, :straight,
             :flush, :full_house, :four_of_a_kind, :straight_flush, :royal]

  attr_accessor :hand_size

  def initialize
    @hand_size = Array.new(5)
  end

  def [](idx)
    @hand_size[idx]
  end
  def rank
    values, num_suits, num_values = rank_helper

    return RANKING[1] if num_values == 4

    if num_values == 3
      values.each { |k, value| return RANKING[3] if value == 3 }
      return RANKING[2]
    end

    if num_values == 2
      values.each { |k, value| return  RANKING[7] if value == 4 }
      return RANKING[6]
    end

    num_hand = hand_num

    if num_hand == [1,2,3,4,13] || num_hand.last - num_hand.first == 4
      if num_suits == 1
        if num_hand.first == 9
          return RANKING[9]
        else
          return RANKING[8]
        end
      else
        RANKING[4]
      end
    elsif num_suits == 1
      RANKING[5]
    else
      RANKING[0]
    end
  end

  def compare(other_hand)
    case RANKING.index(rank) <=> RANKING.index(other_hand.rank)
    when 1
      return 1
    when 0
      case rank
      when :high_card, :flush
        return hand_num <=> other_hand.hand_num
      when :pair, :two_pair
        a = hand_num
        b = other_hand.hand_num
        x = a.select {|el| a.count(el) == 2}
        y = b.select {|el| b.count(el) == 2}
        case x.last <=> y.last
        when 1
          return 1
        when 0
          return a - x <=> b - y
        when -1
          return -1
        end
      when :four_of_a_kind, :three_of_a_kind, :full_house
        return hand_num[2] <=> other_hand.hand_num[2]
      when :straight, :straight_flush
        return hand_num.first <=> other_hand.hand_num.first
      when :royal
        return 0
      end
    when 1
      return 1
    end
  end

  #HELPERS
  protected
  def rank_helper
    suits = Hash.new {|h,k| h[k] = 0}
    values = Hash.new {|h,k| h[k] = 0}

    @hand_size.each do |card|
      suits[card.suit] += 1
      values[card.value] += 1
    end

    num_suits = suits.keys.length
    num_values = values.keys.length

    return [values, num_suits, num_values]
  end

  def hand_num
    num_hand = []
    hand_size.each {|card| num_hand << card.numerical }
    num_hand.sort!
  end
end
