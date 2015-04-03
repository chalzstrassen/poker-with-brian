class Array
  def my_uniq
    uniq_arr = []
      self.each do |el|
        uniq_arr << el unless uniq_arr.include?(el)
      end
    uniq_arr
  end
  def two_sum
    pairs = []
    self.each_index do |idx|
      (idx+1...self.length).each do |idx2|
        pairs << [idx, idx2] if self[idx] + self[idx2] == 0
      end
    end

    pairs
  end
  def my_transpose
    trans_arr = Array.new(self.first.count) {Array.new(self.count)}

    self.each_with_index do |row, r|
      row.each_index do |c|
        trans_arr[c][r] = self[r][c]
      end
    end
    trans_arr
  end
end

def stock_picker(arr)
  cheapest_day = 0
  highest_day = 0
  best_profit = 0
  start_day = 0
  while start_day < arr.length - 1
    finish_day = start_day + 1
    while finish_day < arr.length
      if arr[finish_day] - arr[start_day] > best_profit
        best_profit = arr[finish_day] - arr[start_day]
        cheapest_day = start_day
        highest_day = finish_day
      end
      finish_day += 1
    end
    start_day += 1
  end

  [cheapest_day, highest_day]
end


class TowersOfHanoi
  attr_accessor :pegs
  
  def initialize
    @pegs = [[3,2,1],[],[]]
  end

  def move(peg1, peg2)
    if @pegs[peg2].last.nil?
      @pegs[peg2] << @pegs[peg1].pop
    elsif @pegs[peg2].last > @pegs[peg1].last
      @pegs[peg2] << @pegs[peg1].pop
    else
      return
    end
  end

  def won?
    @pegs == [[],[],[3,2,1]]
  end
end
