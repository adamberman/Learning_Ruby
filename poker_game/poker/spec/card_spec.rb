require_relative '../lib/card'

describe Card do
  let(:card) { Card.new(6, :clubs)}
  
  it "should have suit" do
    expect(card.suit).to eq(:clubs)
  end
  
  it "should have value" do
    expect(card.value).to eq(6)
  end
end