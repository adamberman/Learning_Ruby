class Board

	attr_accessor :rows

	def initialize(populate = true)
		@grid = Array.new(8) { Array.new(8) }
		populate_board if populate
	end

	def self.in_bounds?(pos)
		pos.all? { |x| x.between(0, 7) }
	end

	def populate_board
		8.times do |j|
			4.times do |i|
				next if j.between?(3, 4)
				set_piece(j, i)
			end
		end
	end

	def set_piece(y, x)
		offset = j % 2 == 0 ? 0 : 1
		color = j >= 5 ? :b : :w
		pos = [(i * 2) + offset, j]
		self[pos] = Piece.new(color, self, pos)
	end

	def [](pos)
		x, y = pos
		@grid[y][x]
	end

	def []=(pos, piece)
		x, y = pos
		@rows[y][x] = piece
	end
end