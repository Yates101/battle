require_relative './player.rb'

class Game
  attr_reader :player_1, :player_2, :winner, :loser

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @turn = player_1.name
    @recipient = player_2
  end

  def attack(player)
    player.take_damage
    switch_turn
  end

  def turn
    @turn
  end

  def recipient
    @recipient
  end

  def switch_turn
    @turn = (@turn == player_1.name ? player_2.name : player_1.name)
    @recipient = (@recipient == player_1 ? player_2 : player_1)
  end

  def game_over?
    if player_1.hitpoints == 0 || player_2.hitpoints == 0
      if player_1.hitpoints == 0
        @winner = player_2
        @loser = player_1
      else
        @winner = player_1
        @loser = player_2
      end
      return true
    else
      false
    end
  end
end
