require 'game'

describe Game do

  let(:player_1_mock) { double(Player, hitpoints: 60) }
  let(:player_2_mock) { double(Player, hitpoints: 60) }
  let(:players_game) { Game.new(player_1_mock, player_2_mock) }

  context 'when pased two players' do
    it 'stores the players' do
      expect(players_game.player_1).to eq(player_1_mock)
      expect(players_game.player_2).to eq(player_2_mock)
    end
  end

  context 'attack' do

    it 'casuses damage' do
      player = spy(:player)
      players_game.attack(player)
      expect(player).to have_received(:take_damage)
    end
  end
end