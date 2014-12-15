require_relative '../lib/player'

describe Player do
	let(:player) { Player.new }

	describe "initialize" do
		it "should initialize with a nil hand" do
			expect(player.hand).to be_nil 
		end
	end
end