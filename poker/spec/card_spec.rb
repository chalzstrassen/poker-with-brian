require 'card'

describe Card do

  describe "#numerical" do
    it "should return the numerical value representing high card rank" do
      seven_of_hearts = Card.new(:hearts, :seven)
      expect(seven_of_hearts.numerical).to eq(6)
    end
  end

  describe "self#values" do
    it "should call keys method on hash VALUE" do
      expect(Card::VALUE).to receive(:keys)
      Card.values
    end
  end
end
