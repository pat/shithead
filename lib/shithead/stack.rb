class Shithead::Stack
  attr_reader :sets

  def initialize
    @sets = []
  end

  def add(card)
    if empty? || top.value != card.value
      sets.unshift Shithead::Set.new([card])
    else
      top.add card
    end
  end

  def cards
    sets.collect(&:cards).flatten
  end

  def clearable?
    return false if empty?

    top.value == "10" || top.size >= 4
  end

  def delete(card)
    sets.each { |set| set.delete card }
  end

  def empty?
    sets.empty?
  end

  def release_to(stack)
    sets.each { |set| set.release_to stack }
    sets.clear
  end

  def size
    sets.sum &:size
  end

  def top
    sets.first
  end

  def to_s
    sets.first && sets.first.to_s
  end
end
