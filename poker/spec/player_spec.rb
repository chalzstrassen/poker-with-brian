# describe "#to_string" do
#   it "Puts out a english sentence of hand" do
#     hand.hand_size = [Card.new(:spade, :two), Card.new(:heart, :two),
#                       Card.new(:spade, :ace), Card.new(:clubs, :five),
#                       Card.new(:spade, :jack)]
#
#     expect(hand.to_string).to eq("A")
#   end
# end
require 'player'
describe Player do
  subject(:player) { Player.new }
  subject(:hand) {Hand.new}
  let(:card) { double("card") }
  let(:card1) { double("card1") }
  let(:card2) { double("card2") }
  let(:card3) { double("card3") }
  let(:card4) { double("card4") }

  describe "initialize" do
    it "should initialize player's hand and stack" do
      expect(player.stack).to eq(10000)
      expect(player.hand).to_not eq(nil)
    end
  end

  describe "#discard" do
    it "should discard cards at given indices" do
      hand.hand_size = [card, card1, card2, card3, card4]
      player.hand = hand
      player.discard([1,2])

      expect(player.hand.hand_size).to eq([card,card3,card4])
    end

    it "should return an array of discarded cards" do
      hand.hand_size = [card, card1, card2, card3, card4]
      player.hand = hand


      expect(player.discard([1,2])).to eq([card1,card2])
    end
  end
  describe "#fold" do
    it "should discard your hand" do
      hand.hand_size = [card, card1, card2, card3, card4]
      player.hand = hand
      player.fold

      expect(player.hand.hand_size).to eq([])
    end
    it "should return an array of discarded cards" do
      hand.hand_size = [card, card1, card2, card3, card4]
      player.hand = hand

      expect(player.fold).to eq([card,card1,card2,card3,card4])
    end
  end

  describe "#call" do
    it "should subtract bet amount from stack" do
      player.call(2000)
      expect(player.stack).to eq(8000)
    end

    it "should return the maximum you can put into pot" do
      expect(player.call(2000)).to eq(2000)
    end

    it "should return the maximum you can put into pot" do
      expect(player.call(11000)).to eq(10000)
    end
  end
end
