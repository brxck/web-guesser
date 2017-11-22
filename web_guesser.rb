require "sinatra"
require "sinatra/reloader"

NUMBER = rand(101)

def check_guess(guess)
  if guess == NUMBER
    message = "You got it right! The secret NUMBER is #{NUMBER}"
    color = "green"
  elsif guess < NUMBER
    message = (guess < NUMBER - 5) ? "Way too low!" : "Too low!"
    color = (guess < NUMBER - 5) ? "tomato" : "lightcoral"
  elsif guess > NUMBER
    message = (guess > NUMBER + 5) ? "Way too high!" : "Too high!"
    color = (guess > NUMBER + 5) ? "tomato" : "lightcoral"    
  end
  [message, color]
end

get '/' do
  guess = params["guess"].to_i
  message, color = check_guess(guess)
  erb :index, :locals => { :message => message, :color => color }
end