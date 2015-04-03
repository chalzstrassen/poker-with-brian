require 'hand'

describe Hand do
  subject(:hand) {Hand.new}

  it "It starts with five cards" do
    expect(hand.hand_size.count).to eq(5)
  end

  describe "#rank" do
    it "Ranks its hand" do
      hand.hand_size = [Card.new(:spade, :two), Card.new(:heart, :two),
                        Card.new(:spade, :ace), Card.new(:clubs, :five),
                        Card.new(:spade, :jack)]

      expect(hand.rank).to eq(:pair)
    end

    it "Ranks its hand" do
      hand.hand_size = [Card.new(:spade, :two), Card.new(:spade, :four),
                        Card.new(:spade, :ace), Card.new(:spade, :five),
                        Card.new(:spade, :three)]

      expect(hand.rank).to eq(:straight_flush)
    end

    it "Ranks its hand" do
      hand.hand_size = [Card.new(:spade, :two), Card.new(:spade, :four),
                        Card.new(:heart, :ace), Card.new(:spade, :five),
                        Card.new(:spade, :three)]

      expect(hand.rank).to eq(:straight)
    end
  end

  describe "#compare"
  it "Compares it hand to another hand" do
    hand.hand_size = [Card.new(:spade, :two), Card.new(:heart, :two),
                      Card.new(:spade, :ace), Card.new(:clubs, :five),
                      Card.new(:spade, :jack)]
    hand2 = Hand.new
    hand2.hand_size = [Card.new(:spade, :two), Card.new(:heart, :two),
                      Card.new(:spade, :ace), Card.new(:clubs, :five),
                      Card.new(:spade, :jack)]

    expect(hand.compare(hand2)).to eq(0)
  end
end
