class Shithead::Dealer
  def initialize(deck, players)
    @deck    = deck
    @players = players
  end

  def call
    hidden_cards = players.collect { [] }
    hand_cards   = players.collect { [] }

    3.times do
      players.length.times do |index|
        hidden_cards[index] << deck.draw
      end
    end

    6.times do
      players.length.times do |index|
        hand_cards[index] << deck.draw
      end
    end

    players.each_with_index do |player, index|
      player.hidden.replace hidden_cards[index]
      hand_cards[index].each { |card| player.hand.add card }

      Shithead::AI::DealIn.call player
    end
  end

  private

  attr_reader :deck, :players
end
