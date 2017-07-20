class Shithead::Turn
  def self.call(deck, stack, discards, player)
    new(deck, stack, discards, player).call
  end

  def initialize(deck, stack, discards, player)
    @deck     = deck
    @stack    = stack
    @player   = player
    @discards = discards
    @offer    = Shithead::AI::Offer.call player, stack.top
  end

  def call
    if offer.empty?
      puts "Picking up", ""
      stack.release_to player
    else
      puts "Playing: #{offer.to_s}", ""
      offer.release_to stack

      while player.hand.size < 3 && !deck.empty?
        player.add deck.draw
      end
    end

    if player.clear?
      raise Shithead::GameOverError, "Game over, #{player.name} has won."
    end

    if stack.clearable?
      puts "> Clearing", ""

      stack.release_to discards
      Shithead::Turn.call deck, stack, discards, player
    end
  end

  private

  attr_reader :deck, :stack, :discards, :player, :offer
end
