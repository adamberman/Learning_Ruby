class Piece

	attr_accessor :king, :position

	attr_reader :color, :board

	def initialize(color, board, position)
		@color, @board, @position = color, board, position
		@king = false
	end

	def perform_slide
	end

	def perform_jump
	end

	def move_directions
		directions = [[1, 1], [-1, 1]]
		directions + [[1, -1], [-1, -1]] if king
	end

	def maybe_promote
	end

	def check_for_piece
	end
end