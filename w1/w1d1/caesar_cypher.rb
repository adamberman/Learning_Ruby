def caesar(string, shift)
  string.split(' ').map { |word| convert_word(word, shift) }.join(' ')
end

def convert_word(word, shift)
  letter_array = []
  word.each_byte.to_a.each do |byte|
    byte += shift
    until byte < 122
      byte -= 26
    end
    letter_array << byte
  end
  letter_array.map { |letter| letter.chr }.join
end
  