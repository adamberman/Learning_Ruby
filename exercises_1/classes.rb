class Board
  
  # attr_accessor :board
  
  def intialize
     # @board = Array.new(3) {Array.new(3)}
     @board = [ [nil, nil, nil],
                 [nil, nil, nil],
                 [nil, nil, nil]
     ]
  end
  
  def won?
    return true if  @board[0][0] == @board[0][1] && @board[0][1] == @board[0][2] ||
     @board[1][0] == @board[1][1] && @board[1][1] == @board[1][2] ||
     @board[2][0] == @board[2][1] && @board[2][1] == @board[2][2] ||
     @board[0][0] == @board[1][0] && @board[1][0] == @board[2][0] ||
     @board[0][1] == @board[1][1] && @board[1][1] == @board[2][1] ||
      @board[0][2] == @board[1][2] && @board[1][2] == @board[2][2] ||
      @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] ||
      @board[2][0] == @board[1][1] && @board[1][1] == @board[0][2]
    false
  end
  
  def empty?(pos)
    @board[pos[0]][pos[1]].nil?
  end
  
  def place_mark(pos, mark)
    p @board
    @board[pos[0]][pos[1]] = mark
  end
  
  def print
    @board.each {|i| p i }
  end
  
end



class Game
  
  def play
    board = Board.new
    puts "Human player move first, you are X."
    loop do
      board.print
      puts "Please input row and column number of move (ex: 2,1)"
      move = gets.chomp.split(",")
      move.map! { |i| Integer(i) }
      p move
      board.place_mark(move, "x") #if board.empty?(move)
      board.print
      break if board.won?
      board.place_mark(comp_move(board))
      board.print
      break if board.won?
    end
  end
  
  def comp_move(board)
    winning_pos = [[[0, 0], [0, 1], [0, 2]],
          [[1, 0], [1, 1], [1, 2]],
          [[2, 0], [2, 1], [2, 2]],
          [[0, 0], [1, 0], [2, 0]],
          [[0, 1], [1, 1], [2, 1]],
          [[0, 2], [1, 2], [2, 2]],
          [[0, 0], [1, 1], [2, 2]],
          [[2, 0], [1, 1], [0, 2]]]
    i = 0
    empty = nil
    winning_pos.each do |combo|
      combo.each do |pos|
        i += 1 if board[pos[0]][pos[1]] == "o"
        empty = pos if board[pos[0]][pos[1]].nil?
      end
      (i == 2 && !empty.nil?) ? pos : random_move(board)
    end
  end
  
  def random_move(board)
    positions = [0, 1, 2]
    move = []
    while true
      move = [positions.sample, positions.sample]
      break if board.empty?(move)
    end
    move
  end
end

game = Game.new
game.play