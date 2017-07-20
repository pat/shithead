class Shithead::Set
  attr_reader :value
  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def add(card)
    cards << card
  end

  def delete(card)
    cards.delete card
  end

  def empty?
    cards.empty?
  end

  def rank
    cards.first && cards.first.rank
  end

  def release_to(object)
    cards.each { |card| object.add card }
    cards.clear
  end

  def size
    cards.length
  end

  def to_s
    cards.collect(&:to_s).join(" ")
  end

  def value
    cards.first && cards.first.value
  end
end
