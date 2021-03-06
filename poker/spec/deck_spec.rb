# allow(dog (its a double)).to receive(:friendly?).and_return true
#
# def friendly?
#   true
# end
require 'deck'

describe Deck do
  subject(:deck) { Deck.full_deck }

  describe "self#full_deck" do
    it "should have 52 cards on initialize" do
      expect(deck.count).to eq(52)
    end
  end

  describe "#shuffle" do
    it "should shuffle the deck" do
      expect(deck.cards).to receive(:shuffle!)
      deck.shuffle!
    end
  end

  describe "#take" do
    it "should return an array of a single card" do
      expect(deck.take.length).to eq(1)
    end

    it "should remove the card from the deck" do
      deck.take
      expect(deck.count).to eq(51)
    end
  end

  describe "#draw" do
    it "should return an array of 5 cards" do
      arr = deck.draw
      expect(arr.length).to eq(5)
    end

    it "should call upon method take" do
      expect(deck).to receive(:take).exactly(5).times
      deck.draw
    end
  end
  describe "#put_card" do
    it "should put a card on the bottom" do
      card = deck.take
      deck.put_card(card)
      expect(deck.cards.last).to eq(card)
    end
  end
end
