class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    sum = 0
    aces = 0
    cards.each do |card|
      if card.value == :ace
        aces += 1
      else
        sum += Integer(Card::BLACKJACK_VALUE[card.value]) unless card.value == :ace
      end
    end
    if aces > 0
      if (sum + 10 + aces) > 21
        sum += aces
      else
        sum += 10 + aces
      end
    end

    sum
  end

  def busted?
    return true if points > 21
    false
  end

  def hit(deck)
    raise Exception.new "already busted" if busted?
    self.cards += deck.take(1)
  end

  def beats?(other_hand)
    return true if other_hand.busted?
    return false if points <= other_hand.points || busted?
    true
  end

  def return_cards(deck)
    deck.return(cards)
    self.cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
