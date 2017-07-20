class Shithead::Card
  RANKS = {
    "10" => 1,
    "A"  => 2,
    "2"  => 3,
    "K"  => 4,
    "Q"  => 5,
    "J"  => 6,
    "9"  => 8,
    "8"  => 9,
    "7"  => 10,
    "6"  => 11,
    "5"  => 12,
    "4"  => 13,
    "3"  => 14
  }
  SUITES = {
    "Diamonds" => "♦️",
    "Hearts"   => "♥️",
    "Spades"   => "♠️",
    "Clubs"    => "♣️"
  }

  attr_reader :value, :suite

  def initialize(suite, value)
    @suite = suite
    @value = value
  end

  def rank
    RANKS[value]
  end

  def to_s
    "#{value}#{SUITES[suite]}"
  end
end
