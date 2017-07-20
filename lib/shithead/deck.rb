class Shithead::Deck
  SUITES = %w[ Clubs Diamonds Hearts Spades ].freeze
  VALUES = %w[ A 2 3 4 5 6 7 8 9 10 J Q K ].freeze
  PLAYERS_PER_DECK_RATIO = 3.5

  def initialize(player_count = 1)
    @cards = []

    (player_count / PLAYERS_PER_DECK_RATIO).ceil.times do
      SUITES.each do |suite|
        VALUES.each do |value|
          @cards << Shithead::Card.new(suite, value)
        end
      end
    end

    @cards.shuffle!
  end

  def card_count
    cards.length
  end

  def draw
    cards.shift
  end

  def empty?
    cards.empty?
  end

  private

  attr_reader :cards
end
