class GuessingGame
  attr_accessor :guess, :computer_number
  
  def initialize
    @guess = 0
    @computer_number = computer_guess
  end
  
  def prompt
    puts "Guess a number between 1 and 100."
    self.guess = Integer(gets.chomp)
  end
  
  def computer_guess
    1 + rand(99)
  end
  
  def compare_values
    if guess > computer_number
      puts "Your guess is too high."
      return true
    elsif guess < computer_number
      puts "Your guess is too low."
      return true
    end
      puts "You win!"
      false
    
  end
  
  
  def play_game
    keep_playing = true
    until !keep_playing
      prompt
      keep_playing = compare_values
    end
  end
end
# hi = GuessingGame.new
# hi.play_game

class RPNCalc
  attr_accessor :stack
  
  def initialize
    @stack = []
  end
  
  def interpret(thing)
    push(Integer(thing)) if thing.match(/\d/)
    plus if thing == "+"
    minus if thing == "-"
    multiply if thing == "*"
    divide if thing == "/"
  end
  
  def push(thing)
    stack.push(thing)
  end
  
  def minus
    stack[-2] = stack[-2] - stack[-1]
    stack.pop
  end
  
  def multiply
    stack[-2] = stack[-1] * stack[-2]
    stack.pop
  end
  
  def divide
    stack[-2] = stack[-2] / stack[-1]
    stack.pop
  end
  
  def plus
    stack[-2] = stack[-1] + stack[-2]
    stack.pop
  end
end

  # if __FILE__ == $PROGRAM_NAME
  #   calc = RPNCalc.new
  #   if !ARGV.empty?
  #     contents = File.read(ARGV.shift).split(' ')
  #     contents.each { |thing| calc.interpret(thing) }
  #   else
  #     contents = gets.chomp.split(' ')
  #     contents.each { |thing| calc.interpret(thing) }
  #   end
  #   p calc.stack
  # end
  
  def shuffle_file(original_file)
    contents = File.readlines(original_file).shuffle
    File.open("#{original_file.gsub(".txt", "")}-shuffled.txt", "w") do |f|
      f.puts contents
    end
  end
  
    shuffle_file("file_test.txt")