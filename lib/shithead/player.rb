class Shithead::Player
  attr_reader :name, :hand, :visible, :hidden

  def initialize(name)
    @name    = name
    @hidden  = []
    @visible = Shithead::SortedStack.new
    @hand    = Shithead::SortedStack.new
  end

  def add(card)
    hand.add card
  end

  def clear?
    hidden.empty? && visible.empty? && hand.empty?
  end

  def hand_count
    hand.length
  end

  def hidden_count
    hidden.length
  end
end
