# /dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/dice/2/6") do
  d1 = rand(1..6)
  d2 = rand(1..6)
  total = d1 + d2
  @message = "You rolled #{d1} and #{d2}. Your total is #{total}"
  erb(:two_six)
end
