require_relative '../lib/deck'

describe Deck do
  let(:deck) { Deck.new }
  
  it "should have 52 cards" do
    expect(deck.cards.count).to eq(52)
  end
  
  it "should have no duplicate card" do
    expect(deck.cards.uniq).to eq(deck.cards)
  end
  
  describe "#give_cards" do
    it "should be able to give cards from top of deck" do
      expect(deck.give_cards(2).count).to eq(2)
      expect(deck.cards.count).to eq(50)
    end
  end
  
  describe "#accept_cards" do
    it "should be able to accept cards at bottom of deck" do
      card1 = Card.new(6, :clubs)
      card2 = Card.new(:king, :diamonds)
      deck.accept_cards([card1, card2])
      expect(deck.cards[-1]).to equal(card2)
      expect(deck.cards[-2]).to equal(card1) 
    end
  end
  
  it "should be able to shuffle"
end