require_relative '../lib/deck'
require_relative '../lib/card'

RSpec.describe Deck, "#valid_card?" do
    context "When the given card is valid" do 
      it "returns true if a card is valid when given a valid card" do
        deck = Deck.new
        card = Card.new("C", 2)
        result = deck.valid_card?(card)
        expect(result).to eq true
      end
    end
    context "When a given card is not valid" do
      it "returns false if a card is not valid when given an invalid card" do
        deck = Deck.new
        card = Card.new("X", 12)
        result = deck.valid_card?(card)
        expect(result).to eq false
      end
    end
end