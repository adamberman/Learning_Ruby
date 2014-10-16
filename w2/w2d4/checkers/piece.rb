class Piece

	DIRECTIONS = [[1, 1], [-1, 1], [1, -1], [-1, -1]]

	attr_accessor :king, :pos

	attr_reader :color, :board

	def initialize(color, board, position)
		@color, @board, @position = color, board, position
		@king = false
	end

	def perform_slide(end_pos)
		board.in_bounds?(end_pos) && slideable?(end_pos)
	end

	def slideable?(end_pos)
		board[end_pos].nil? && in_sliding_direction?(end_pos)
	end

	def in_sliding_direction?(end_pos)
		move_directions.each do |direction|
			possible_pos = [end_pos[0] + direction[0], end_pos[1] + direction[1]]
			return true if possible_pos == end_pos
		end
		
		false
	end

	def perform_jump
	end

	def move_directions
		return DIRECTIONS if king
		return DIRECTIONS[0..1] if :w
		DIRECTIONS[2..3]
	end

	def maybe_promote
	end
end