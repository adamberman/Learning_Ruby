class Player

	attr_reader :color, :board

	def initialize(color, board)
		@color, @board = color, board
	end

	def play_turn
		begin
			input = pick_piece
			piece = parse(input)
			check_piece(piece)
		rescue InvalidPieceError
			"Make sure you only select your own piece"
			retry
		end
		move_sequence = pick_moves
		piece.perform_moves(parse(move_sequence))
	rescue InvalidMoveError
		"Make sure you're following the rules. Let's try again."
		retry
	end

	def pick_piece
		puts "Please pick a piece to move (ex: a4)"
		gets.chomp.downcase
	end

	def parse(input)
		input.split.map { |pos| [letter_hash[pos[0]], Integer(pos[1]) - 1 }
	end

	def check_piece(piece)
		raise InvalidPieceError unless piece.color == color
	end

	def pick_moves
		puts "Please pick a place or a sequence of places to move seperated by a space"
		puts "(ex: b3 or c2 e4)"
		gets.chomp.downcase
	end

	def letter_hash
		{	'a' => 0,
  		'b' => 1,
  		'c' => 2,
  		'd' => 3,
  		'e' => 4,
  		'f' => 5,
  		'g' => 6,
  		'h' => 7
    }
  end
end