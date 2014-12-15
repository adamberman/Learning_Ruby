def rps(input)
  game_result(sanitize_input(input), randomizer)
end

def randomizer
  ["Rock", "Paper", "Scissors"].sample
end

def sanitize_input(input)
  input = input.downcase.capitalize
  raise ArgumentError, "Enter Rock, Paper, or Scissors." if !correct_input?(input)
  input
end

def correct_input?(input)
  ["Rock", "Paper", "Scissors"].include?(input)
end

def game_result(input, random)
  result = nil
  if input == "Rock"
    result = rock(random)
  elsif input == "Paper"
    result = paper(random)
  else
    result = scissors(random)
  end

  puts "#{ random }, #{ result }"
end

def rock(random)
  if random == "Paper"
    "Lose"
  elsif random == "Rock"
    "Draw"
  else
    "Win"
  end
end

def scissors(random)
  if random == "Rock"
    "Lose"
  elsif random == "Scissors"
    "Draw"
  else
    "Win"
  end
end

def paper(random)
  if random == "Scissors"
    "Lose"
  elsif random == "Paper"
    "Draw"
  else
    "Win"
  end
end

# rps("Rock")
# rps("Scissors")
# rps("Scissors")
# rps("scissors")
# rps("ROCK")
# rps("hello")

def remix(drinks)
  alcohols = strip(drinks, 0)
  mixers = strip(drinks, 1)
  solution = mixer(alcohols, mixers)
end

def strip(drinks, index)
  stripped = []
  drinks.each { |drink| stripped << drink[index] }
  stripped
end

def mixer(alcohols, mixers)
  solution = []
  size = alcohols.size
  alcohol_order = randomize(size)
  mixers_order = randomize(size)
  alcohol_order.each { |i| solution << [alcohols[i]] }
  mixers_order.each_with_index { |value, i| solution[i] << mixers[value] }
  solution
end

def randomize(size)
  (0...size).to_a.permutation(size).to_a.sample
end

p remix([
  ["rum", "coke"],
  ["gin", "tonic"],
  ["scotch", "soda"]
])