class Shithead::SortedStack < Shithead::Stack
  def add(card)
    if set_for(card.value)
      set_for(card.value).add card
    else
      sets << Shithead::Set.new([card])
      sets.replace sets.sort_by(&:rank).reverse
    end
  end

  def delete(card)
    set = set_for(card.value)
    set.delete card

    sets.delete set if set.empty?
  end

  def take(set)
    sets.delete set
    set
  end

  def to_s
    sets.collect(&:to_s).join(" ")
  end

  private

  def set_for(value)
    sets.detect { |set| set.value == value }
  end
end
