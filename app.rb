require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base
  set :session_secret, 'secret sessions be secret'
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do    
    @player_1 = Player.new(params[:player_1])
    @player_2 = Player.new(params[:player_2])
    $game = Game.new(@player_1, @player_2)
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $game.player_1.name
    @player_2_name = $game.player_2.name
    @player_1_hit_points = $game.player_1.hitpoints
    @player_2_hit_points = $game.player_2.hitpoints
    erb(:play)
  end

  get '/attack' do
    @player_1_name = $game.player_1.name
    @player_2_name = $game.player_2.name
    $game.attack($game.player_2)
    @player_1_hit_points = $game.player_1.hitpoints
    @player_2_hit_points = $game.player_2.hitpoints
    erb(:attack)
  end
end
