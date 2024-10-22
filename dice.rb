# /dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  "
  <h1>Dice Roll</h1>
  <ul>
    <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
    <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
    <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
    <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
  </ul>
  "
end

get("/dice/2/6") do
  d1 = rand(1..6)
  d2 = rand(1..6)
  total = d1 + d2
  message = "You rolled #{d1} and #{d2}. Your total is #{total}"
  "<h1>2ds</h1>
  <p>You rolled #{d1} and #{d2}. Your total is #{total}</p>"
end
