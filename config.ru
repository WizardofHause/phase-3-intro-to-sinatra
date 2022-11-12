require 'sinatra'

class App < Sinatra::Base

  get '/hello' do
    '<h2>Hello <em>World</em>!</h2>'
  end

  get '/potato' do
    "<p>Boil 'em, mash 'em, stick 'em in a stew.</p>"
  end

  # get '/batman' do
  #   "I'm Batmaaaan" # <-- renders as <text> tag in the html
  # end

  get '/static_dice' do
    dice_roll = rand(1...6)
    "<h2>You rolled a #{dice_roll}!</h2>"
  end

  get '/dice' do
    dice_roll = rand(1...6)
    { 
      roll: dice_roll, 
      # name: "Johannsen", 
      # travel_channel: "Guy Fieri",
      # track_list: [
      #   "Aint No Sunshine", 
      #   "Drumroll Please", 
      #   "Wowee Wow Wow", 
      #   "Can't Take-a Me Blind Man", 
      #   "Shorts", 
      #   "Sometimes When the Weather's Dry", 
      #   "Chitlins and Champagne"
      #   ]
      }.to_json
  end

  # STATIC ROUTE
  get '/add/1/2' do
    sum = 1 + 2
    { result: sum }.to_json
  end

  # DYNAMIC ROUTE
  get 'add/:num1/:num2' do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i

    sum = num1 + num2
    { result: sum }.to_json
  end
  # ^^^ => {"num1"=>"1", "num2"=>"2"}

  # EX: to find a specific GAME from the GAMES table by "id"...
  # get '/games/:id' do
  #   game = Game.find(params[:id])
  #   game.to_json
  # end

end

run App
