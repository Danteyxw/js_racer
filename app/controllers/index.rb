get '/' do
  erb :index
end

post '/registration' do
  byebug

  player1 = Player.find_or_create_by(name: params[:player1])
  player2 = Player.find_or_create_by(name: params[:player2])

  unless player1.nil? || player2.nil?
    game = Game.new
    game.players << player1
    game.players << player2
    game.save

    redirect "/game/#{game.id}"
  else
    "The game needs 2 players to begin."
  end
end

get '/game/:id' do
  erb :game
end