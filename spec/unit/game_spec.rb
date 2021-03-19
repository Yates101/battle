require 'game'

describe Game do
  let(:player_1_mock) { double(Player, hitpoints: 60, name: "Taran") }
  let(:player_2_mock) { double(Player, hitpoints: 60, name: "Alec") }
  let(:players_game) { Game.new(player_1_mock, player_2_mock) }

  context 'when pased two players' do
    it 'stores the players' do
      expect(players_game.player_1).to eq(player_1_mock)
      expect(players_game.player_2).to eq(player_2_mock)
    end
  end

  describe 'attack' do
    it 'casuses damage' do
      player = spy(:player)
      players_game.attack(player)
      expect(player).to have_received(:take_damage)
    end

    context 'when a users HP reaches 0' do
      let(:losing_player) { double(Player, hitpoints: 0, name: "Alec") }

      it 'ends the game' do
        endgame = Game.new(player_1_mock, losing_player)
        expect(endgame.game_over?).to eq true 
      end
    end
  end

  describe '#turn' do
    context 'when start' do
      it 'player1''s turn' do
        expect(players_game.turn).to eq "Taran"
      end
    end

    context 'after 1 attack' do
      it 'player2''s turn' do
        allow(player_2_mock).to receive(:take_damage)
        players_game.attack(player_2_mock)
        expect(players_game.turn).to eq "Alec"
      end

      it 'changes the recipient' do
        allow(player_2_mock).to receive(:take_damage)
        players_game.attack(player_2_mock)
        expect(players_game.recipient).to eq player_1_mock
      end
    end
  end
end
