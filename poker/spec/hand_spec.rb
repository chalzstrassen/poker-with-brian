require 'hand'

describe Hand do
  subject(:hand) {Hand.new}

  it "It starts with five cards" do
    expect(hand.hand_size.count).to eq(5)
  end

  describe "#rank" do
    it "Ranks its hand" do
      hand.hand_size = [Card.new(:spades, :two), Card.new(:hearts, :two),
                        Card.new(:spades, :ace), Card.new(:clubss, :five),
                        Card.new(:spades, :jack)]

      expect(hand.rank).to eq(:pair)
    end

    it "Ranks its hand" do
      hand.hand_size = [Card.new(:spades, :two), Card.new(:spades, :four),
                        Card.new(:spades, :ace), Card.new(:spades, :five),
                        Card.new(:spades, :three)]

      expect(hand.rank).to eq(:straight_flush)
    end

    it "Ranks its hand" do
      hand.hand_size = [Card.new(:spades, :two), Card.new(:spades, :four),
                        Card.new(:hearts, :ace), Card.new(:spades, :five),
                        Card.new(:spades, :three)]

      expect(hand.rank).to eq(:straight)
    end
  end

  describe "#compare"
  it "Compares it hand to another hand Tie" do
    hand.hand_size = [Card.new(:spades, :two), Card.new(:hearts, :two),
                      Card.new(:spades, :ace), Card.new(:clubs, :five),
                      Card.new(:spades, :jack)]
    hand2 = Hand.new
    hand2.hand_size = [Card.new(:diamonds, :two), Card.new(:clubs, :two),
                      Card.new(:clubs, :ace), Card.new(:hearts, :five),
                      Card.new(:clubs, :jack)]

    expect(hand.compare(hand2)).to eq(0)
  end

  it "Compares it hand to another hand 2 Pair" do
    hand.hand_size = [Card.new(:spades, :two), Card.new(:hearts, :two),
                      Card.new(:spades, :ace), Card.new(:clubs, :ace),
                      Card.new(:spades, :jack)]
    hand2 = Hand.new
    hand2.hand_size = [Card.new(:diamonds, :two), Card.new(:hearts, :two),
                      Card.new(:hearts, :ace), Card.new(:diamonds, :ace),
                      Card.new(:spades, :queen)]

    expect(hand.compare(hand2)).to eq(-1)
  end

  it "Compares it hand to another hand Flushes" do
    hand.hand_size = [Card.new(:spades, :two), Card.new(:spades, :two),
                      Card.new(:spades, :ace), Card.new(:spades, :five),
                      Card.new(:spades, :jack)]
    hand2 = Hand.new
    hand2.hand_size = [Card.new(:clubs, :two), Card.new(:clubs, :two),
                      Card.new(:clubs, :king), Card.new(:clubs, :five),
                      Card.new(:clubs, :jack)]

    expect(hand.compare(hand2)).to eq(1)
  end

  it "Compares it hand to another hand Straights" do
    hand.hand_size = [Card.new(:spades, :two), Card.new(:spades, :three),
                      Card.new(:spades, :ace), Card.new(:clubs, :five),
                      Card.new(:spades, :four)]
    hand2 = Hand.new
    hand2.hand_size = [Card.new(:clubs, :ace), Card.new(:clubs, :queen),
                      Card.new(:clubs, :king), Card.new(:hearts, :ten),
                      Card.new(:clubs, :jack)]

    expect(hand.compare(hand2)).to eq(-1)
  end

  it "Compares it hand to another hand Full House" do
    hand.hand_size = [Card.new(:spades, :queen), Card.new(:spades, :three),
                      Card.new(:diamonds, :queen), Card.new(:clubs, :three),
                      Card.new(:clubs, :queen)]
    hand2 = Hand.new
    hand2.hand_size = [Card.new(:clubs, :ace), Card.new(:hearts, :nine),
                      Card.new(:clubs, :nine), Card.new(:hearts, :ace),
                      Card.new(:diamonds, :nine)]

    expect(hand.compare(hand2)).to eq(1)
  end
end
