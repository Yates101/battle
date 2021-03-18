require 'player'

describe Player do
  let(:player) { Player.new("Lily") }

  it 'returns the players name' do
    expect(player.name).to eq ("Lily")
  end

  it 'initialises with 60 hitpoints' do
    expect(player.hitpoints).to eq 60
  end
end