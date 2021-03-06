require_relative '../lib/hand_ranker'
require_relative '../lib/hand'
require_relative '../lib/card'

RSpec.describe HandRanker, '#contains_pair?' do
  context 'When the hand contains 2 cards with the same value' do
    it 'returns true' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('C', 4)
      card2 = Card.new('H', 4)
      hand.add_card(card1)
      hand.add_card(card2)
      result = hand_ranker.contains_pair?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain 2 cards with the same value' do
    it 'returns false' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('D', 6)
      card2 = Card.new('H', 4)
      hand.add_card(card1)
      hand.add_card(card2)
      result = hand_ranker.contains_pair?
      expect(result).to be false
    end
  end
end

RSpec.describe HandRanker, '#contains_three_of_kind' do
  context 'When the hand contains 3 cards with the same value' do
    it 'returns true' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('C', 4)
      card2 = Card.new('H', 4)
      card3 = Card.new('D', 4)
      card4 = Card.new('D', "K")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      result = hand_ranker.contains_three_of_kind?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain 3 cards with the same value' do
    it 'returns false' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('C', 4)
      card2 = Card.new('H', "Q")
      card3 = Card.new('D', 4)
      card4 = Card.new('D', "K")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      result = hand_ranker.contains_three_of_kind?
      expect(result).to be false
    end
  end
end

RSpec.describe HandRanker, '#contains_four_of_kind' do
  context 'When the hand contains 4 cards with the same value' do
    it 'returns true' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('C', "J")
      card2 = Card.new('H', "J")
      card3 = Card.new('D', "J")
      card4 = Card.new('S', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      result = hand_ranker.contains_four_of_kind?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain 4 cards with the same value' do
    it 'returns false' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('C', 4)
      card2 = Card.new('H', "Q")
      card3 = Card.new('D', 4)
      card4 = Card.new('D', "Q")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      result = hand_ranker.contains_four_of_kind?
      expect(result).to be false
    end
  end
end

RSpec.describe HandRanker, '#contains_full_house' do
  context 'When the hand contains a full house' do
    it 'returns true' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('C', 4)
      card2 = Card.new('H', 4)
      card3 = Card.new('D', 4)
      card4 = Card.new('D', "K")
      card5 = Card.new('S', "K")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_full_house?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain a full house' do
    it 'returns false' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('C', 4)
      card2 = Card.new('H', "Q")
      card3 = Card.new('D', 4)
      card4 = Card.new('D', "K")
      card5 = Card.new('S', "K")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_full_house?
      expect(result).to be false
    end
  end
end

RSpec.describe HandRanker, '#contains_two_pair' do
  context 'When the hand contains two pairs of matching cards' do
    it 'returns true' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('C', 4)
      card2 = Card.new('H', 4)
      card3 = Card.new('D', 7)
      card4 = Card.new('D', "K")
      card5 = Card.new('S', "K")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_two_pair?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain two pairs of matching cards' do
    it 'returns false' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('C', 4)
      card2 = Card.new('H', 4)
      card3 = Card.new('D', 7)
      card4 = Card.new('D', 3)
      card5 = Card.new('S', "K")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_two_pair?
      expect(result).to be false
    end
  end
end

RSpec.describe HandRanker, '#contains_flush' do
  context 'When the hand contains a flush' do
    it 'returns true' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('D', 4)
      card2 = Card.new('D', 3)
      card3 = Card.new('D', 7)
      card4 = Card.new('D', "K")
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_flush?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain a flush' do
    it 'returns false' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('H', 4)
      card2 = Card.new('C', 3)
      card3 = Card.new('D', 7)
      card4 = Card.new('S', "K")
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_flush?
      expect(result).to be false
    end
  end
end

RSpec.describe HandRanker, '#contains_royal_flush' do
  context 'When the hand contains a royal flush' do
    it 'returns true' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('D', 10)
      card2 = Card.new('D', "Q")
      card3 = Card.new('D', "A")
      card4 = Card.new('D', "K")
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_royal_flush?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain a royal flush' do
    it 'returns false' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('H', 4)
      card2 = Card.new('C', 3)
      card3 = Card.new('D', 7)
      card4 = Card.new('S', "K")
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_royal_flush?
      expect(result).to be false
    end
  end
end

RSpec.describe HandRanker, '#contains_straight' do
  context 'When the hand contains a straight' do
    it 'returns true' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('S', 10)
      card2 = Card.new('C', 9)
      card3 = Card.new('H', 8)
      card4 = Card.new('D', 7)
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_straight?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain a straight' do
    it 'returns false' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('H', 4)
      card2 = Card.new('C', 3)
      card3 = Card.new('D', 7)
      card4 = Card.new('S', "K")
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_straight?
      expect(result).to be false
    end
  end
  context 'When the hand contains a straight with ace high' do
    it 'returns true' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('S', 10)
      card2 = Card.new('C', "J")
      card3 = Card.new('H', "Q")
      card4 = Card.new('D', "K")
      card5 = Card.new('D', "A")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_straight?
      expect(result).to be true
    end
  end
  context 'When the hand contains a straight with ace low' do
    it 'returns true' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('S', 5)
      card2 = Card.new('C', 4)
      card3 = Card.new('H', 3)
      card4 = Card.new('D', 2)
      card5 = Card.new('D', "A")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_straight?
      expect(result).to be true
    end
  end
  context 'When the hi/low difference is 4 and the hand is not a straight' do
    it 'returns false' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('S', 7)
      card2 = Card.new('C', 7)
      card3 = Card.new('H', 7)
      card4 = Card.new('D', 8)
      card5 = Card.new('D', 'J')
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_straight?
      expect(result).to be false
    end
  end
end

RSpec.describe HandRanker, '#contains_straight_flush' do
  context 'When the hand contains a straight flush' do
    it 'returns true' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('S', 10)
      card2 = Card.new('S', 9)
      card3 = Card.new('S', 8)
      card4 = Card.new('S', 7)
      card5 = Card.new('S', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_straight_flush?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain a straight flush' do
    it 'returns false' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      card1 = Card.new('H', 4)
      card2 = Card.new('C', 3)
      card3 = Card.new('D', 7)
      card4 = Card.new('S', "K")
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_ranker.contains_straight_flush?
      expect(result).to be false
    end
  end
end