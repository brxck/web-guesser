require "sinatra"
require "sinatra/reloader"

def caesar_cipher(input, shift)
  output = []
  base = ""
  input.split("").each do |char|
    if char.match(/[a-z]|[A-Z]/) do # only shift letters
      base = char.match(/[a-z]/) ? "a".ord : "A".ord end # preserve case
      ascii = (char.ord - base + shift.to_i) % 26 + base
      output.push(ascii.chr)
    else
      output.push(char)
    end
  end
  output.join
end

get "/" do
  encoded = caesar_cipher(params["message"], params["shift"].to_i)
  haml :index, :locals => { :encoded => encoded }
end
