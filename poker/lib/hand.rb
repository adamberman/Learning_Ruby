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

  def won?(other_hand)
    return true if calculate_value > other_hand.calculate_value
    return false if calculate_value < other_hand.calculate_value
    won_tie_hand?(other_hand)
  end

  def won_tie_hand?(other_hand)
    if calculate_value == (8 || 5) || 4
      sort_hand.reverse.each do |hcard|
        other_hand.sort_hand.reverse.each do |ohcard|
          return true if hcard > oh_card
          return false if hcard < oh_card
        end
      end
      false
    elsif calculate_value == (7 || 6) || 3
      sort_hand[2] > other_hand.sort_hand[2]
    else
      count_hash = Hash.new(0)
      sort_hand.each do |card|
        count_hash[card] += 1
      end
      oh_count_hash = Hash.new(0)
      other_hand.sort_hand.each do |card|
        oh_count_hash[card] += 1
      end
      pairs = count_hash.select { |key, value| value > 1 }.keys
      oh_pairs = oh_count_hash.select { |key, value| value > 1 }.keys
      pairs.sort.reverse.each do |pair|
        oh_pairs.sort.reverse.each do |oh_pair|
          return true if pair > oh_pair
          return false if pair < oh_pair
        end
      end
      other_cards = count_hash.reject { |key, value| value > 1 }.keys
      oh_other_cards = oh_count_hash.select { |key, value| value > 1 }.keys
      other_cards.sort.reverse.each do |card|
        oh_other_cards.sort.reverse.each do |oh_card|
          return true if card > oh_card
          return false if card < oh_card
        end
      end
    end  
  end

  def count_cards
    cardz = sort_hand
    count_hash = Hash.new(0)
    cardz.each do |card|
      count_hash[card] += 1
    end
    count_hash
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
    straight? && flush?
  end
  
  def four_of_a_kind?
    count_hash = count_cards
    return true if count_hash.values.any? { |j| j == 4 }
    false
  end
    
  def full_house?
    cardz = sort_hand
    count_hash = Hash.new(0)
    cardz.each do |card|
      count_hash[card] += 1
    end
    if count_hash.values.any? { |j| j == 3 } && count_hash.values.any? { |j| j == 2 }
      return true
    end
    false
  end
  
  def flush?
    Deck::SUITS.each do |suit|
      return true if cards.all? { |card| card.suit == suit }
    end
    
    false
  end
  
  def straight?
    cardz = sort_hand
    i = cardz.first
    4.times do |j|
      i +=1
      return false if cardz[j + 1] != i
    end 
    true
  end
  
  def three_of_a_kind?
    cardz = sort_hand
    count_hash = Hash.new(0)
    cardz.each do |card|
      count_hash[card] += 1
    end
    return true if count_hash.values.any? { |j| j == 3 }
    false
  end
  
  def two_pair?
    cardz = sort_hand
    count_hash = Hash.new(0)
    cardz.each do |card|
      count_hash[card] += 1
    end
    if count_hash.values.any? { |j| j == 2 }
      selected_hash = count_hash.select { |key, value| value > 1 }
      if selected_hash.keys.count > 1
        return true
      end
    end
    false
  end
  
  def pair?
    cardz = sort_hand
    count_hash = Hash.new(0)
    cardz.each do |card|
      count_hash[card] += 1
    end
    return true if count_hash.values.any? { |j| j == 2 }
    false
  end
end

#enforce limit, no more than 5 cards