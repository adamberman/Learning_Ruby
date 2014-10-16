require './piece.rb'

class Board

	attr_accessor :grid

	def initialize(populate = true)
		@grid = Array.new(8) { Array.new(8) }
		populate_board if populate
	end

	def self.in_bounds?(pos)
		pos.all? { |x| x.between?(0, 7) }
	end

	def populate_board
		(0..7).each do |j|
			next if j == 3 || j == 4
			(0..3).each do |i|
				set_piece(i, j)
			end
		end
	end

	def set_piece(x, y)
		offset = y % 2 == 0 ? 0 : 1
		color = y >= 5 ? :b : :w
		pos = [(x * 2) + offset, y]
		self[pos] = Piece.new(color, self, pos)
	end

	def [](pos)
		x, y = pos
		@grid[y][x]
	end

	def []=(pos, piece)
		x, y = pos
		@grid[y][x] = piece
	end
end

board = Board.new(false)
piece = Piece.new(:b, board, [2,0])
board[[2,0]] = piece
p piece.perform_slide([3,-1])
