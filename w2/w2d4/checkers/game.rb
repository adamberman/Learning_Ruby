require './board.rb'
require './player.rb'

class Game

	attr_accessor :current_player

	attr_reader :player1, :player2, :board

	def initialize(player1, player2, board)
		@player1, @player2, @board = player1, player2, board
		@current_player = player1
	end

	def play
		player = player1
		until game_over?
			board.display
			player.take_turn
			switch_players
		end
		end_game_message
	end

	def game_over?
		won? || board.draw?
	end

	def win?
		board.won?(:w) || board.won?(:b)
	end

	def switch_players
		self.current_player = current_player == player1 ? player2 : player1
	end
end