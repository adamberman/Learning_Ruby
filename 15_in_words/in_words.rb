class Fixnum
  ONES = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  TEENS = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
  TENS = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
  def in_words
    prefixes = [['hundred', 2], ['thousand', 3], ['million', 6], ['billion', 9], ['trillion', 12]]
    num = self
    if self == 0
      return 'zero'
    end
    answer = ''
    while !prefixes.empty?
      prefix = prefixes.pop
      divisor = 10 ** prefix[1]
      if num / divisor != 0
        answer << turn_to_english(num) + " #{prefix[0]}"
        num /= divisor
      end
    end
    answer << num.turn_to_english if num > 0
    answer
  end
  
  def turn_to_english
    words = []
    if self / 100 != 0
      words << (self / 100).hundredize
    end
    self -= ((self / 100) * 100)
    if self / 10 != 0
      words << (self / 10).tenize
    end
    if self > 19
      self -= ((self / 10) * 10)
      if self != 0
        words << self.oneize
      end
    end
    words.join(' ')
  end
  
  def hundredize
    "#{ONES[(self / 100) - 1]} hundred"
  end
  
  def tenize
    if self > 19
      TENS[(self / 10) - 1]
    else
      TEENS[self - 10]
    end
  end
  
  def oneize
    ONES[self - 1]
  end
end
  