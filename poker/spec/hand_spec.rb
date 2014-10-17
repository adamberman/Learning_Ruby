require_relative '../lib/hand'

describe Hand do
  let(:deck) { Deck.new }
  let(:hand) { Hand.deal_from_deck(deck) }
  
  it "should be an array" do
    expect(hand.cards).to be_kind_of(Array)
  end
  
  it "should have 5 cards" do
    expect(hand.cards.count).to eq(5)
  end
  
  it "should have a deck attribute" do
    expect(hand.deck).to be_true
  end
  
  describe "#return cards" do
    it "should return cards back to the deck" do
      hand.return_cards([0,2])
      expect(hand.cards.count).to eq(3)
    end
  end
  
  describe "#get cards" do
    it "should get cards from the deck" do
      current_count = hand.cards.count
      hand.get_cards(2)
      expect(hand.cards.count).to eq(2 + current_count)
    end
  end
  
  describe "#calculate value" do
    it "calculates the comparitor value of the hand" do
      card1 = Card.new(:ace, :spades)
      card2 = Card.new(:king, :spades)
      card3 = Card.new(:queen, :spades)
      card4 = Card.new(:jack, :spades)
      card5 = Card.new(10, :spades)
      hand1 = Hand.new(deck, [card1, card2, card3, card4, card5])
      expect(hand1.calculate_value).to eq(8)
    end
  end
  
  describe "#sort hand" do
    it "sorts hands" do
      card2 = Card.new(:ace, :spades)
      card3 = Card.new(:king, :spades)
      card5 = Card.new(:queen, :spades)
      card1 = Card.new(:jack, :spades)
      card4 = Card.new(10, :spades)
      hand1 = Hand.new(deck, [card1, card2, card3, card4, card5])
      hand1 = Hand.new(deck, [card2, card3, card5, card1, card4])
      expect(hand1.sort_hand).to eq(hand2)
    end
  end
  
  it "should determine if it has won"

end
