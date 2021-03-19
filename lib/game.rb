require_relative './player.rb'

class Game
  attr_reader :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @turn = player_1.name
  end

  def attack(player)
    player.take_damage
    switch_turn
  end

  def turn
    @turn
  end

  def switch_turn
    @turn = (@turn == player_1.name ? player_2.name : player_1.name)
  end

end