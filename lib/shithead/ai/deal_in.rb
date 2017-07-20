class Shithead::AI::DealIn
  def self.call(player)
    new(player).call
  end

  def initialize(player)
    @player = player
  end

  def call
    return if player.hand.empty?

    3.times { place ordered.shift }
  end

  private

  attr_reader :player

  def ordered
    @ordered ||= player.hand.cards.sort_by(&:rank)
  end

  def place(card)
    player.visible.add card
    player.hand.delete card
  end
end
