require "sinatra"
require "sinatra/reloader"

NUMBER = rand(101)

def check_guess(guess)
  if guess == NUMBER
    message = "You got it right! The secret NUMBER is #{NUMBER}"
  elsif guess < NUMBER
    message = (guess < NUMBER - 5) ? "Way too low!" : "Too low!" 
  elsif guess > NUMBER
    message = (guess > NUMBER + 5) ? "Way too high!" : "Too high!"     
  end
end

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => { :message => message }
end