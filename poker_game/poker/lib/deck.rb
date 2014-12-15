require_relative 'card'

class Deck
  attr_accessor :cards
  
  VALUES = { 2 => 2, 
             3 => 3, 
             4 => 4, 
             5 => 5, 
             6 => 6, 
             7 => 7, 
             8 => 8, 
             9 => 9, 
             10 => 10, 
             :jack  => 11, 
             :queen => 12, 
             :king => 13, 
             :ace => 14
  }
  
  SUITS = [:clubs, :diamonds, :spades, :hearts]
  
  def initialize
    @cards = []
    build_deck
  end
  
  def build_deck
    VALUES.each do |value|
      SUITS.each do |suit|
        cards << Card.new(value, suit)
      end
    end
  end
  
  def give_cards(n)
    result = []
    n.times { result << cards.shift }
    result
  end
  
  def accept_cards(card_arr)
    card_arr.each { |card| cards << card }
  end
  
  def shuffle
    cards.shuffle
  end
end