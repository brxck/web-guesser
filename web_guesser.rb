require "sinatra"
require "sinatra/reloader"

random_number = rand(101)

get '/' do
  "The secret number is #{random_number}."
end