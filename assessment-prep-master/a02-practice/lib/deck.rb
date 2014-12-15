require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []
    Card::VALUE_STRINGS.each do |key, value|
      Card::SUIT_STRINGS.each do |key2, suit|
        cards << Card.new(key2, key)
      end
    end

    cards
  end

  def initialize(cards = Deck.all_cards)
    @deck = cards
  end

  # Returns the number of cards in the deck.
  def count
    @deck.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise Exception.new "not enough cards" if n > count
    first_cards = @deck[0...n]
    n.times { @deck.shift }
    first_cards
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @deck += cards
  end
end
