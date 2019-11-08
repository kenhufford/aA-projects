require "card"

class Deck
    attr_reader :cards
    SUITS = ["hearts", "spades", "clubs", "diamonds"]
    VALUES = ["A", "K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
    def initialize
        @cards = []
        SUITS.each do |suit|
            VALUES.each do |value|
                @cards << Card.new(suit, value)
            end
        end
        @cards.shuffle!
    end

    def draw_card
        card = cards.shift
    end

    def deck_shuffle
        @cards.shuffle!
    end
end