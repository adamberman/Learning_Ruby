class Piece

	DIRECTIONS = [[1, 1], [-1, 1], [1, -1], [-1, -1]]

	attr_accessor :king, :pos

	attr_reader :color, :board

	def initialize(color, board, pos)
		@color, @board, @pos = color, board, pos
		@king = false
	end

	def perform_slide(end_pos)
		board.class.in_bounds?(end_pos) && slideable?(end_pos)
	end

	def perform_jump(end_pos)
		board.class.in_bounds?(end_pos) && jumpable?(end_pos)
	end

	

	def slideable?(end_pos)
		board[end_pos].nil? && in_valid_direction?(end_pos, 1)
	end

	def in_valid_direction?(end_pos, spaces)
		move_directions.each do |direction|
			x = pos[0] + (spaces * direction[0])
			y = pos[1] + (spaces * direction[1])
			return true if [x, y] == end_pos
		end

		false
	end

	def jumpable?(end_pos)
		jumping_space?(end_pos) && in_valid_direction?(end_pos, 2)
	end

	def jumping_space?(end_pos)
		board[end_pos].nil? && something_to_jump?(end_pos)
	end

	def something_to_jump?(end_pos)
		x = pos[0] + ((end_pos[0] - pos[0]) / 2)
		y = pos[1] + ((end_pos[1] - pos[1]) / 2)
		!board[[x, y]].nil? && board[[x, y]].color != color
	end

	def move_directions
		return DIRECTIONS if king
		return DIRECTIONS[0..1] if color == :w
		DIRECTIONS[2..3]
	end

	def maybe_promote
	end

	def inspect
		print color == :b ? "B" : "W"
	end
end