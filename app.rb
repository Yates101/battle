require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base
  set :session_secret, 'secret sessions be secret'
  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do
    erb(:index)
  end

  post '/names' do    
    @player_1 = Player.new(params[:player_1])
    @player_2 = Player.new(params[:player_2])
    @game = Game.create(@player_1, @player_2)
    redirect '/play'
  end

  get '/play' do
    if @game.game_over?
      redirect '/game_over'
    end
    erb(:play)
  end

  get '/attack' do
    @game.attack(@game.recipient)
    erb(:attack)
  end

  get '/game_over' do
    erb(:game_over)
  end
end
