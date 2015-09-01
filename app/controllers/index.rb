get '/' do
  erb :index
end

post '/registration' do
  player1 = Player.find_or_create_by(name: params[:player1].strip)
  player2 = Player.find_or_create_by(name: params[:player2].strip)

  session[:player1] = player1.name
  session[:player2] = player2.name

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
  @player1 = session[:player1]
  @player2 = session[:player2]

  session[:time] = Time.now
  erb :game
end

post '/game/win' do
  @game = Game.find(params[:game].split("/").last)
  @winner = params[:winner]
  time = (Time.now - session[:time]).to_f
  @game.update(time: time, winner: @winner)
end