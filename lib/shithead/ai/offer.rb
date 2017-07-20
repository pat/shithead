class Shithead::AI::Offer
  EMPTY_SET = Shithead::Set.new

  def self.call(player, top)
    new(player, top).call
  end

  def initialize(player, top)
    @player = player
    @top    = top
  end

  def call
    draw_from_hidden if empty_hand?
    return EMPTY_SET if lowest_possible.nil?

    available.take lowest_possible
  end

  private

  attr_reader :player, :top

  def available
    @available ||= player.hand.empty? ? player.visible : player.hand
  end

  def draw_from_hidden
    player.hidden.shuffle!
    player.add player.hidden.shift
  end

  def empty_hand?
    player.hand.empty? && player.visible.empty?
  end

  def play_lowest?
    top.nil? || top.value == "2"
  end

  def lowest_possible
    @lowest_possible ||= if play_lowest?
      ordered.first
    else
      ordered.detect { |set| set.rank <= top.rank }
    end
  end

  def ordered
    @ordered ||= available.sets.sort_by(&:rank).reverse
  end
end
