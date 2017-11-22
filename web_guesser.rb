require "sinatra"
require "sinatra/reloader"

class Guesser
  attr_reader :number, :guesses

  def initialize
    @number = rand(101)
    @guesses = 5
  end

  def make_guess(guess)
    @guesses -= 1
    if @guesses.zero?
      initialize
      return ["You lost!", "red"]
    end
    check_guess(guess)
  end

  def check_guess(guess)
    if guess == @number
      message = "You got it right! The secret number is #{@number}"
      color = "green"
    elsif guess < @number
      message = guess < @number - 5 ? "Way too low!" : "Too low!"
      color = guess < @number - 5 ? "tomato" : "lightcoral"
    elsif guess > @number
      message = guess > @number + 5 ? "Way too high!" : "Too high!"
      color = guess > @number + 5 ? "tomato" : "lightcoral"
    end
    [message, color]
  end
end

guesser = Guesser.new

get "/" do
  guess = params["guess"].to_i
  message, color = guesser.make_guess(guess)
  erb :index, :locals => { :message => message, :color => color }
end
