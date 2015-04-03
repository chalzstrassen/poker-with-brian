require_relative 'w1d1'

describe "my_unique" do
  it "return unique elements in array" do
    arr = [1,2,1,3,3]
    expect(arr.my_uniq).to eq([1,2,3])
  end
end
describe "two_sum" do
  it "return pairs in an array that sum equals 0" do
    arr = [-1,0,2,-2,1]
    expect(arr.two_sum).to eq([[0,4], [2,3]])
  end
end
describe "my_transpose" do
  it "Transposes a matrix" do
    arr = [[0, 1, 2],
          [3, 4, 5],
          [6, 7, 8]]
    expect(arr.my_transpose).to eq([[0, 3, 6],
                                    [1, 4, 7],
                                    [2, 5, 8]])
  end
end

describe "#stock_picker" do
  it "outputs the most profitable pair of days to buy and sell" do
    arr = [23, 26, 20, 39, 28]
    expect(stock_picker(arr)).to eq([2,3])
  end
end

describe TowersOfHanoi do
  subject(:tower) {TowersOfHanoi.new}
  describe "#won?" do
    it "returns true if player gets all disks in pile in order" do
      tower.pegs = [[],[],[3,2,1]]
      expect(tower.won?).to be true
    end

    it "returns false if player hasn't finished" do
      tower.pegs = [[],[1],[2,3]]
      expect(tower.won?).to be false
    end
  end

  describe "#move" do
    it "Take a disk from one pile and put it on top of another" do
      tower.move(0,1)
      expect(tower.pegs).to eq([[3,2], [1], []])
    end
    it "Won't allow a larger disk on smaller disk" do
      tower.pegs = [[3],[2],[1]]
      tower.move(0,1)
      expect(tower.pegs).to eq([[3],[2],[1]])
    end
  end
end
