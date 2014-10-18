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
  
  def sort_hand
    hand_values = cards.map { |card| Deck::VALUES[card.value] }
    hand_values.sort
  end
  
  def calculate_value
    case 
    when straight_flush? then return 8
    when four_of_a_kind? then return 7
    when full_house? then return 6
    when flush? then return 5
    when straight? then return 4
    when three_of_a_kind? then return 3
    when two_pair? then return 2
    when pair? then return 1
    else
      return 0
    end
  end
  
  def straight_flush?
    
  end
  
  def four_of_a_kind?
    
  end
  
  def full_house?
    
  end
  
  def flush?
  
  end
  
  def straight?
    
  end
  
  def three_of_a_kind?
    
  end
  
  def two_pair?
    
  end
  
  def pair?
    
  end
end

#enforce limit, no more than 5 cards