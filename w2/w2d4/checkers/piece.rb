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

	def possible_moves
	end

	def maybe_promote
	end


end