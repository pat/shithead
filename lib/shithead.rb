module Shithead
  module AI
  end

  Error         = Class.new StandardError
  GameOverError = Class.new Shithead::Error
end

require "shithead/card"
require "shithead/dealer"
require "shithead/deck"
require "shithead/player"
require "shithead/set"
require "shithead/stack"
require "shithead/sorted_stack"
require "shithead/turn"

require "shithead/ai/deal_in"
require "shithead/ai/offer"
