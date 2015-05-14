class Deck

  def initialize
    @cards = Array.new
    suits = [:hearts, :diamonds, :clubs, :spades]
    suits.each do |suit|
      (2..10).each do |value|
        @cards.push(Card.new(suit, value))
      end
      @cards.push(Card.new(suit, 10)) #J
      @cards.push(Card.new(suit, 11)) #Q
      @cards.push(Card.new(suit, 12)) #K
      @cards.push(Card.new(suit, 13)) #A
    end
    @cards = @cards.shuffle
  end

  def draw
    @cards.pop
  end

  def count
    @cards.count
  end
end
