#Text Analyzer

#reads the text
lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

#count the characters
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, '').length

#count the words, sentences, paragraphs
word_count = text.split.length
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|!/).length

#make a list of words that aren't stopwords, count them
#and analyze the percentages of non-stop words
stopwords = %w{the a by on for of are with just but and to the my I has some in}
words = text.scan(/\w+/)
keywords = words.select {|word| !stopwords.include?(word)}

#Summarize the text with medium sized, noun oriented sentences
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by {|sentence| sentence.length}
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, (one_third + 1))
ideal_sentences = ideal_sentences.select {|sentence| sentence =~ /is|are/}

#give the analysis
puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters excluding spaces"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} sentences"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{((keywords.count.to_f / words.count.to_f) * 100).to_i} percent of words are non-stop"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"
