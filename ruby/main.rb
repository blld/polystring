
require_relative "polystring"

Polystring.identifier = ENV["LANG"] if ENV["LANG"]

# Usage

greetings = Polystring.new("fr\\Bonjour\0  it\\Ciao\0  Hello")

puts "#{ greetings } -- #{ Polystring.identifier }"
puts greetings.to("fr")
puts greetings.to("it")
puts greetings.to("en")

puts "raw: #{ greetings.raw }"
