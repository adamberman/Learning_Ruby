class Hand
  attr_accessor :deck, :cards
  
  def initialize(deck, cards)
    @deck, @cards = deck, cards
  end
  
  def self.deal_from_deck(deck)
    Hand.new(deck, deck.give_cards(5))
  end
  
  def return_cards(arr)
    return_arr = []
    arr.each do |index|
      return_arr << cards[index]
      cards.delete_at(index)
    end
    deck.accept_cards(return_arr)
  end
  
  def get_cards(num)
    self.cards += deck.give_cards(num)
  end
  
  def sort_hand(&blk)
    cards.sort { blk.call }
  end
  
  def calculate_value
    # case
#     when
#     when
#     end
  end
end

#enforce limit, no more than 5 cards