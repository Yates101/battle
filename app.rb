require 'sinatra/base'
require_relative './lib/player.rb'

class Battle < Sinatra::Base
  set :session_secret, 'secret sessions be secret'
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do    
    $player_1 = Player.new(params[:player_1])
    $player_2 = Player.new(params[:player_2])
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    @player_1_hit_points = $player_1.hitpoints
    @player_2_hit_points = $player_2.hitpoints
    erb(:play)
  end

  get '/attack' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    $player_2.attack    
    @player_1_hit_points = $player_1.hitpoints
    @player_2_hit_points = $player_2.hitpoints
    erb(:attack)
  end
end
