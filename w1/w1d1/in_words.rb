class Fixnum
  ONES = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  TEENS = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
  TENS = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
  def to_words
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
        answer << turn_to_english(num / divisor) + " #{prefix[0]}"
      end
    end
  end
  
  def turn_to_english(num)
    words = []
    if num / 100 != 0
      words << hundredize(num / 100)
    end
    num -= ((num / 100) * 100)
    if num / 10 != 0
      words <<tenize(num / 10)
    end
    if num > 19
      num -= ((num / 10) * 10)
      if num != 0
        words << oneize(num)
      end
    end
    words.join(' ')
  end
  
  def hundredize(num)
    "#{ONES[(num / 100) - 1]} hundred"
  end
  
  def tenize(num)
    if num > 19
      TENS[(num / 10) - 1]
    else
      TEENS[num - 10]
    end
  end
  
  def oneize(num)
    ONES[num - 1]
  end
end
  