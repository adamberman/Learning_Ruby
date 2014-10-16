class Piece

	DIRECTIONS = [[1, 1], [-1, 1], [1, -1], [-1, -1]]

	attr_accessor :king, :pos

	attr_reader :color, :board

	def initialize(color, board, position)
		@color, @board, @position = color, board, position
		@king = false
	end

	def perform_slide(end_pos)
		board.on_board?(end_pos) && slideable?(end_pos)
	end

	def legal_spot

	def perform_jump
	end

	def move_directions
		return DIRECTIONS if king
		return DIRECTIONS[0..1] if :w
		DIRECTIONS[2..3]
	end

	def maybe_promote
	end

	def check_for_piece
	end
end